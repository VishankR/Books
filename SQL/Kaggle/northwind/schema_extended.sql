/**
 Author: Vishank 
 Model : NorthWind
**/

DROP SCHEMA IF EXISTS northwind;

CREATE SCHEMA northwind;
USE northwind;

/* Table: customers */
CREATE TABLE customers (
  id              INT NOT NULL,
  company         VARCHAR(50) ,
  lastName       VARCHAR(50) ,
  firstName      VARCHAR(50) ,
  emailAddress   VARCHAR(50) ,
  jobTitle       VARCHAR(50) ,
  businessPhone  VARCHAR(25) ,
  homePhone      VARCHAR(25) ,
  mobilePhone    VARCHAR(25) ,
  faxNumber      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  stateProvince  VARCHAR(50) ,
  zipPostalCode VARCHAR(15) ,
  countryRegion  VARCHAR(50) ,
  webPage        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: employees */
CREATE TABLE employees (
  id              INT NOT NULL,
  company         VARCHAR(50) ,
  lastName       VARCHAR(50) ,
  firstName      VARCHAR(50) ,
  emailAddress   VARCHAR(50) ,
  jobTitle       VARCHAR(50) ,
  businessPhone  VARCHAR(25) ,
  homePhone      VARCHAR(25) ,
  mobilePhone    VARCHAR(25) ,
  faxNumber      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  stateProvince  VARCHAR(50) ,
  zipPostalCode VARCHAR(15) ,
  countryRegion  VARCHAR(50) ,
  webPage        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: inventory_transaction_types */
CREATE TABLE inventoryTransactionTypes (
  id TINYINT NOT NULL,
  typeName VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

/* Table: shippers */
CREATE TABLE shippers (
  id              INT NOT NULL,
  company         VARCHAR(50) ,
  lastName       VARCHAR(50) ,
  firstName      VARCHAR(50) ,
  emailAddress   VARCHAR(50) ,
  jobTitle       VARCHAR(50) ,
  businessPhone  VARCHAR(25) ,
  homePhone      VARCHAR(25) ,
  mobilePhone    VARCHAR(25) ,
  faxNumber      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  stateProvince  VARCHAR(50) ,
  zipPostalCode VARCHAR(15) ,
  countryRegion  VARCHAR(50) ,
  webPage        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: orders */
CREATE TABLE orders (
  id              INT NOT NULL,
  employeeId     INT ,
  customerId     INT ,
  orderDate      DATETIME ,
  shippedDate    DATETIME ,
  shipperId      INT ,
  shipName       VARCHAR(50) ,
  shipAddress    VARCHAR(250) ,
  shipCity       VARCHAR(50) ,
  shipStateProvince  VARCHAR(50) ,
  shipZipPostalCode VARCHAR(50) ,
  shipCountryRegion  VARCHAR(50) ,
  shippingFee    DECIMAL(19,4) NULL DEFAULT '0.0000',
  taxes           DECIMAL(19,4) NULL DEFAULT '0.0000',
  paymentType    VARCHAR(50) ,
  paidDate       DATETIME ,
  notes           VARCHAR(250) ,
  taxRate        DOUBLE NULL DEFAULT '0',
  taxStatusId   TINYINT ,
  statusId       TINYINT NULL DEFAULT '0',
  PRIMARY KEY (id)
);

/* Table: orders_status */
CREATE TABLE ordersStatus (
  id          TINYINT     NOT NULL,
  statusName VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

/* Table: orders_tax_status */
CREATE TABLE ordersTaxStatus (
  id              TINYINT     NOT NULL,
  taxStatusName VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

/* Table: order_details */
CREATE TABLE orderDetails (
  id                  INT NOT NULL,  
  orderId            INT NOT NULL,
  productId          INT ,
  quantity            DECIMAL(18,4) NOT NULL DEFAULT '0.0000',
  unitPrice          DECIMAL(19,4) NULL DEFAULT '0.0000',
  discount            DOUBLE NOT NULL DEFAULT '0',
  statusId           INT ,
  dateAllocated      DATETIME ,
  purchaseOrderId   INT ,
  inventoryId        INT ,
  PRIMARY KEY (id)
);

/* Table: order_details_status */
CREATE TABLE orderDetailsStatus (
  id            INT         NOT NULL,
  statusName   VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

/* Table: products */
CREATE TABLE products (
  id              INT NOT NULL,
  supplierIds    VARCHAR(250) ,
  productCode    VARCHAR(25) ,
  productName    VARCHAR(50) ,
  description     VARCHAR(250) ,
  standardCost   DECIMAL(19,4) NULL DEFAULT '0.0000',
  listPrice      DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  reorderLevel   INT ,
  targetLevel    INT ,
  quantityPerUnit VARCHAR(50) ,
  discontinued    TINYINT NOT NULL DEFAULT '0',
  minimumReorderQuantity INT ,
  category        VARCHAR(50) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: suppliers */
CREATE TABLE suppliers (
  id              INT NOT NULL,
  company         VARCHAR(50) ,
  lastName       VARCHAR(50) ,
  firstName      VARCHAR(50) ,
  emailAddress   VARCHAR(50) ,
  jobTitle       VARCHAR(50) ,
  businessPhone  VARCHAR(25) ,
  homePhone      VARCHAR(25) ,
  mobilePhone    VARCHAR(25) ,
  faxNumber      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  stateProvince  VARCHAR(50) ,
  zipPostalCode VARCHAR(15) ,
  countryRegion  VARCHAR(50) ,
  webPage        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: purchaseOrders */
CREATE TABLE purchaseOrders (
  id              INT NOT NULL,
  supplierId     INT ,
  createdBy      INT ,
  submittedDate  DATETIME ,
  creationDate   DATETIME ,
  statusId       INT NULL DEFAULT '0',
  expectedDate   DATETIME ,
  shippingFee    DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  taxes           DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  paymentDate    DATETIME ,
  paymentAmount  DECIMAL(19,4) NULL DEFAULT '0.0000',
  paymentMethod  VARCHAR(50) ,
  notes           VARCHAR(250) ,
  approvedBy     INT ,
  approvedDate   DATETIME ,
  submittedBy    INT ,
  PRIMARY KEY (id)
);

/* Table: purchaseOrderDetails */
CREATE TABLE purchaseOrderDetails (
  id                  INT NOT NULL,    
  purchaseOrderId   INT NOT NULL,
  productId          INT ,
  quantity            DECIMAL(18,4) NOT NULL,
  unitCost           DECIMAL(19,4) NOT NULL,
  dateReceived       DATETIME ,
  postedToInventory TINYINT NOT NULL DEFAULT '0',
  inventoryId        INT ,
  PRIMARY KEY (id)
);

/* Table: purchase_order_status */
CREATE TABLE purchaseOrderStatus (
  id      INT NOT NULL,
  status  VARCHAR(50) ,
  PRIMARY KEY (id)
);

/* Table: inventoryTransactions */
CREATE TABLE inventoryTransactions (
  id                  INT NOT NULL,
  transactionType    TINYINT(4) NOT NULL,
  transactionCreatedDate    DATETIME ,
  transactionModifiedDate   DATETIME ,
  productId          INT NOT NULL,
  quantity            INT NOT NULL,
  purchaseOrderId   INT ,
  customerOrderId   INT ,
  comments            VARCHAR(255) ,
  PRIMARY KEY (id)
);

/* Table: invoices */
CREATE TABLE invoices (
  id            INT NOT NULL,
  orderId      INT ,
  invoiceDate  DATETIME ,
  dueDate      DATETIME ,
  tax           DECIMAL(19,4) NULL DEFAULT '0.0000',
  shipping      DECIMAL(19,4) NULL DEFAULT '0.0000',
  amountDue    DECIMAL(19,4) NULL DEFAULT '0.0000',
  PRIMARY KEY (id)
);

/* Table: strings */
CREATE TABLE strings (
  stringId   INT NOT NULL,
  stringData VARCHAR(255) ,
  PRIMARY KEY (stringId)
);


/* Foreign Key: orders */
ALTER TABLE orders ADD CONSTRAINT fkOrdersCustomers FOREIGN KEY (customerId) REFERENCES customers(id);
ALTER TABLE orders ADD CONSTRAINT fkOrdersEmployees FOREIGN KEY (employeeId) REFERENCES employees(id);
ALTER TABLE orders ADD CONSTRAINT fkOrdersShippers  FOREIGN KEY (shipperId)  REFERENCES shippers(id);
ALTER TABLE orders ADD CONSTRAINT fkOrdersOrdersTaxStatus FOREIGN KEY (taxStatusId) REFERENCES ordersTaxStatus(id);
ALTER TABLE orders ADD CONSTRAINT fkOrdersOrdersStatus     FOREIGN KEY (statusId)     REFERENCES ordersStatus(id);
/* Foreign Key:  order_details */
ALTER TABLE orderDetails ADD CONSTRAINT fkOrderDetailsOrders      FOREIGN KEY (orderId) REFERENCES orders(id);
ALTER TABLE orderDetails ADD CONSTRAINT fkOrderDetailsProducts    FOREIGN KEY (productId) REFERENCES products(id);
ALTER TABLE orderDetails ADD CONSTRAINT fkOrderDetailsOrderDetailsStatus FOREIGN KEY (statusId) REFERENCES orderDetailsStatus (id);

/* Foreign Key: inventoryTransactions */
ALTER TABLE inventoryTransactions ADD CONSTRAINT fkInventoryTransactionsOrders          FOREIGN KEY (customerOrderId) REFERENCES orders(id);
ALTER TABLE inventoryTransactions ADD CONSTRAINT fkInventoryTransactionsProducts        FOREIGN KEY (productId) REFERENCES products(id);
ALTER TABLE inventoryTransactions ADD CONSTRAINT fkInventoryTransactionsPurchaseOrders FOREIGN KEY (purchaseOrderId) REFERENCES purchaseOrders(id);
ALTER TABLE inventoryTransactions ADD CONSTRAINT fkInventoryTransactionsInventoryTransactionTypes FOREIGN KEY (transactionType) REFERENCES inventoryTransactionTypes(id);

/* Foreign Key: purchaseOrders */
ALTER TABLE purchaseOrders ADD CONSTRAINT fkPurchaseOrdersEmployees FOREIGN KEY (createdBy)  REFERENCES  employees(id);
ALTER TABLE purchaseOrders ADD CONSTRAINT fkPurchaseOrdersSuppliers FOREIGN KEY (supplierId) REFERENCES suppliers(id);
ALTER TABLE purchaseOrders ADD CONSTRAINT fkPurchaseOrdersPurchaseOrderStatus FOREIGN KEY (statusId) REFERENCES purchaseOrderStatus(id);
/* Foreign Key: purchaseOrderDetails */
ALTER TABLE purchaseOrderDetails ADD CONSTRAINT fkPurchaseOrderDetailsInventoryTransactions FOREIGN KEY (inventoryId) REFERENCES inventoryTransactions(id);
ALTER TABLE purchaseOrderDetails ADD CONSTRAINT fkPurchaseOrderDetailsProducts FOREIGN KEY (productId) REFERENCES products (id);
ALTER TABLE purchaseOrderDetails ADD CONSTRAINT fkPurchaseOrderDetailsPurchaseOrders FOREIGN KEY (purchaseOrderId) REFERENCES purchaseOrders(id);

/* Foreign Key: invoices */
ALTER TABLE invoices ADD CONSTRAINT fkInvoicesOrders FOREIGN KEY (orderId) REFERENCES orders(id);


