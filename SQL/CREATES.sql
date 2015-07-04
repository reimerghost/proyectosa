CREATE table "CLIENTE" (
    "IDCLIENTE"    NUMBER(20,0) NOT NULL,
    "NOMBRE"       VARCHAR2(30) NOT NULL,
    "APELLIDO"     VARCHAR2(30) NOT NULL,
    "DIRECCION"    VARCHAR2(60) NOT NULL,
    "TELEFONO"     VARCHAR2(10) NOT NULL,
    "USUARIO"      VARCHAR2(15) NOT NULL,
    "PASSWORD"     VARCHAR2(15) NOT NULL,
    "FECHA_CREADO" DATE NOT NULL,
    constraint  "CLIENTE_PK" primary key ("IDCLIENTE")
)
/

CREATE sequence "CLIENTE_SEQ" 
/

CREATE trigger "BI_CLIENTE"  
  before insert on "CLIENTE"              
  for each row 
begin  
  if :NEW."IDCLIENTE" is null then
    select "CLIENTE_SEQ".nextval into :NEW."IDCLIENTE" from dual;
  end if;
end;
/   


CREATE table "CUENTA" (
    "IDCUENTA"   NUMBER(20,0) NOT NULL,
    "SALDO"      NUMBER(20,2) NOT NULL,
    "IDCLIENTE"  NUMBER(20,0),
    constraint  "CUENTA_PK" primary key ("IDCUENTA")
)
/

CREATE sequence "CUENTA_SEQ" 
/

CREATE trigger "BI_CUENTA"  
  before insert on "CUENTA"              
  for each row 
begin  
  if :NEW."IDCUENTA" is null then
    select "CUENTA_SEQ".nextval into :NEW."IDCUENTA" from dual;
  end if;
end;
/   

ALTER TABLE "CUENTA" ADD CONSTRAINT "CUENTA_FK" 
FOREIGN KEY ("IDCLIENTE")
REFERENCES "CLIENTE" ("IDCLIENTE")
ON DELETE SET NULL

/

