-- Insertando categorías
INSERT INTO categories (name, description) VALUES 
(N'Electrónica', N'Dispositivos y gadgets'),
(N'Ropa', N'Prendas de vestir y accesorios'),
(N'Electrodomésticos', N'Aparatos para el hogar'),
(N'Juguetes', N'Juguetes para niños de todas las edades'),
(N'Libros', N'Libros de diversos géneros y autores'),
(N'Deportes', N'Equipamiento y ropa deportiva'),
(N'Muebles', N'Muebles para el hogar y oficina'),
(N'Jardinería', N'Herramientas y accesorios para el jardín'),
(N'Alimentos', N'Productos alimenticios y bebidas'),
(N'Belleza', N'Productos de belleza y cuidado personal');

-- Insertando productos
INSERT INTO products (name, description, price, stock, category_id) VALUES 
(N'Teléfono Inteligente', N'Último modelo de smartphone con características avanzadas', 699.99, 50, 1),
(N'Jeans', N'Cómodos jeans azules', 49.99, 100, 2),
(N'Horno Microondas', N'Horno microondas compacto con múltiples configuraciones', 89.99, 30, 3),
(N'Muñeca', N'Muñeca de trapo con vestimenta colorida', 19.99, 200, 4),
(N'Coche de Juguete', N'Coche de juguete a control remoto', 29.99, 150, 4),
(N'Novela', N'Novela de misterio y suspenso', 14.99, 80, 5),
(N'Libro de Cocina', N'Libro con recetas internacionales', 24.99, 60, 5),
(N'Bicicleta', N'Bicicleta de montaña con 21 velocidades', 299.99, 20, 6),
(N'Sofá', N'Sofá de tres plazas en color gris', 499.99, 10, 7),
(N'Crema Facial', N'Crema hidratante para el cuidado diario', 15.99, 150, 10);

-- Insertando clientes
INSERT INTO customers (first_name, last_name, email, phone) VALUES 
(N'Juan', N'Pérez', N'juan.perez@ejemplo.com', N'123-456-7890'),
(N'Ana', N'García', N'ana.garcia@ejemplo.com', N'098-765-4321'),
(N'Carlos', N'López', N'carlos.lopez@ejemplo.com', N'321-654-0987'),
(N'María', N'Fernández', N'maria.fernandez@ejemplo.com', N'654-321-9870'),
(N'Luis', N'Martínez', N'luis.martinez@ejemplo.com', N'987-654-3210'),
(N'Laura', N'Gómez', N'laura.gomez@ejemplo.com', N'456-789-0123'),
(N'Pedro', N'Sánchez', N'pedro.sanchez@ejemplo.com', N'789-012-3456'),
(N'Sofía', N'Ruiz', N'sofia.ruiz@ejemplo.com', N'012-345-6789'),
(N'Miguel', N'Hernández', N'miguel.hernandez@ejemplo.com', N'345-678-9012'),
(N'Lucía', N'Ramírez', N'lucia.ramirez@ejemplo.com', N'678-901-2345');

-- Insertando órdenes
INSERT INTO orders (customer_id, order_date, total_amount) VALUES 
(1, '2023-10-01 10:00:00', 749.98),
(2, '2023-10-02 15:30:00', 139.98),
(3, '2023-10-03 11:45:00', 49.98),
(4, '2023-10-04 16:20:00', 44.98),
(5, '2023-10-05 09:10:00', 299.99),
(6, '2023-10-06 14:00:00', 499.99),
(7, '2023-10-07 18:30:00', 15.99),
(8, '2023-10-08 12:15:00', 29.99),
(9, '2023-10-09 17:45:00', 24.99),
(10, '2023-10-10 11:00:00', 89.99);

-- Insertando items de órdenes
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES 
(1, 1, 1, 699.99),
(1, 2, 1, 49.99),
(2, 3, 1, 89.99),
(2, 2, 1, 49.99),
(3, 4, 2, 19.99),
(3, 5, 1, 29.99),
(4, 6, 1, 14.99),
(4, 7, 1, 24.99),
(5, 8, 1, 299.99),
(6, 9, 1, 499.99);

-- Insertando ubicaciones
INSERT INTO locations (name, description) VALUES 
(N'Almacén A', N'Instalación principal de almacenamiento'),
(N'Tienda', N'Ubicación de la tienda minorista'),
(N'Almacén B', N'Segundo almacén para productos adicionales'),
(N'Sucursal Centro', N'Tienda ubicada en el centro de la ciudad'),
(N'Sucursal Norte', N'Tienda ubicada en la zona norte'),
(N'Sucursal Sur', N'Tienda ubicada en la zona sur'),
(N'Sucursal Este', N'Tienda ubicada en la zona este'),
(N'Sucursal Oeste', N'Tienda ubicada en la zona oeste'),
(N'Almacén C', N'Tercer almacén para productos adicionales'),
(N'Centro de Distribución', N'Centro de distribución regional');

-- Insertando ubicaciones de productos
INSERT INTO product_locations (product_id, location_id, quantity) VALUES 
(1, 1, 30),
(2, 1, 50),
(3, 2, 20),
(4, 1, 100),
(5, 1, 50),
(6, 2, 40),
(7, 2, 30),
(8, 3, 10),
(9, 4, 5),
(10, 5, 150);
