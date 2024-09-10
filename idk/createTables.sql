-- Tabla categories
CREATE TABLE categories (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  name NVARCHAR(255) NOT NULL,
  description NVARCHAR(MAX)
);

-- Tabla products
CREATE TABLE products (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  name NVARCHAR(255) NOT NULL,
  description NVARCHAR(MAX),
  price DECIMAL(10, 2) NOT NULL,
  stock INT NOT NULL,
  category_id BIGINT FOREIGN KEY REFERENCES categories (id)
);

-- Tabla customers
CREATE TABLE customers (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  first_name NVARCHAR(255) NOT NULL,
  last_name NVARCHAR(255) NOT NULL,
  email NVARCHAR(255) UNIQUE NOT NULL,
  phone NVARCHAR(50)
);

-- Tabla orders
CREATE TABLE orders (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  customer_id BIGINT FOREIGN KEY REFERENCES customers (id),
  order_date DATETIME2 DEFAULT GETDATE(),
  total_amount DECIMAL(10, 2) NOT NULL
);

-- Tabla order_items
CREATE TABLE order_items (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  order_id BIGINT FOREIGN KEY REFERENCES orders (id),
  product_id BIGINT FOREIGN KEY REFERENCES products (id),
  quantity INT NOT NULL,
  price DECIMAL(10, 2) NOT NULL
);

-- Eliminación de tablas (si existen)
IF OBJECT_ID('order_items', 'U') IS NOT NULL
    DROP TABLE order_items;

IF OBJECT_ID('orders', 'U') IS NOT NULL
    DROP TABLE orders;

IF OBJECT_ID('customers', 'U') IS NOT NULL
    DROP TABLE customers;

-- Comentarios en las tablas y columnas
EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Tabla que almacena las categorías de los productos.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'categories';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Tabla que almacena los productos disponibles en la tienda.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'products';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Identificador único de la categoría.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'categories', 
    @level2type = N'COLUMN', @level2name = 'id';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Nombre de la categoría.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'categories', 
    @level2type = N'COLUMN', @level2name = 'name';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Descripción de la categoría.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'categories', 
    @level2type = N'COLUMN', @level2name = 'description';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Identificador único del producto.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'products', 
    @level2type = N'COLUMN', @level2name = 'id';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Nombre del producto.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'products', 
    @level2type = N'COLUMN', @level2name = 'name';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Descripción del producto.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'products', 
    @level2type = N'COLUMN', @level2name = 'description';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Precio del producto.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'products', 
    @level2type = N'COLUMN', @level2name = 'price';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Cantidad disponible en inventario.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'products', 
    @level2type = N'COLUMN', @level2name = 'stock';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Referencia a la categoría del producto.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'products', 
    @level2type = N'COLUMN', @level2name = 'category_id';

-- Tabla locations
CREATE TABLE locations (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  name NVARCHAR(255) NOT NULL,
  description NVARCHAR(MAX)
);

-- Tabla product_locations
CREATE TABLE product_locations (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  product_id BIGINT FOREIGN KEY REFERENCES products (id),
  location_id BIGINT FOREIGN KEY REFERENCES locations (id),
  quantity INT NOT NULL
);

-- Comentarios para las nuevas tablas y columnas
EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Tabla que almacena las ubicaciones de los productos.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'locations';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Tabla que relaciona productos con sus ubicaciones específicas.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'product_locations';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Identificador único de la ubicación.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'locations', 
    @level2type = N'COLUMN', @level2name = 'id';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Nombre de la ubicación.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'locations', 
    @level2type = N'COLUMN', @level2name = 'name';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Descripción de la ubicación.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'locations', 
    @level2type = N'COLUMN', @level2name = 'description';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Identificador único de la relación entre producto y ubicación.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'product_locations', 
    @level2type = N'COLUMN', @level2name = 'id';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Referencia al producto.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'product_locations', 
    @level2type = N'COLUMN', @level2name = 'product_id';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Referencia a la ubicación.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'product_locations', 
    @level2type = N'COLUMN', @level2name = 'location_id';

EXEC sp_addextendedproperty @name = N'MS_Description', 
    @value = N'Cantidad del producto en esa ubicación.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'product_locations', 
    @level2type = N'COLUMN', @level2name = 'quantity';
