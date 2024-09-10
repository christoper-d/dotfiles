import sqlite3
import logging
import time

def create_connection(db_file):
    """Crea una conexión a la base de datos SQLite."""
    try:
        conn = sqlite3.connect(db_file)
        logging.info("Conexión establecida a la base de datos.")
        return conn
    except sqlite3.Error as e:
        logging.error(f"Error al conectar a la base de datos: {e}")
        return None

def load_payloads(file_path):
    """Carga payloads de inyección SQL desde un archivo."""
    try:
        with open(file_path, 'r') as file:
            payloads = [line.strip() for line in file if line.strip()]
        logging.info(f"{len(payloads)} payloads cargados desde {file_path}.")
        return payloads
    except FileNotFoundError:
        logging.error(f"Archivo no encontrado: {file_path}")
        return []

def sql_injection_test(conn, payloads):
    """Prueba una lista de payloads de inyección SQL."""
    for payload in payloads:
        try:
            cur = conn.cursor()
            # Intentar inyección SQL
            sql = f"SELECT * FROM users WHERE username = '{payload}'"
            logging.info(f"Ejecutando SQL: {sql}")
            start_time = time.time()
            cur.execute(sql)
            rows = cur.fetchall()
            execution_time = time.time() - start_time

            if rows:
                logging.info(f"Payload exitoso: {payload}")
                for row in rows:
                    logging.info(f"Resultado: {row}")
            else:
                logging.info(f"Payload fallido: {payload}")

            # Detección de inyecciones basadas en tiempo
            if execution_time > 2:  # Umbral de tiempo para detectar retrasos
                logging.warning(f"Posible inyección basada en tiempo detectada con payload: {payload}")

        except sqlite3.Error as e:
            logging.error(f"Error al ejecutar la consulta: {e}")

def main():
    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
    database = "test.db"
    payload_file = "payloads.txt"

    # Crea una conexión a la base de datos
    conn = create_connection(database)

    if conn:
        # Cargar payloads desde un archivo
        payloads = load_payloads(payload_file)

        # Probar inyecciones SQL
        sql_injection_test(conn, payloads)

        conn.close()

if __name__ == '__main__':
    main()
