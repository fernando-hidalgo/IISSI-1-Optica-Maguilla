 DELETE FROM ENCARGOS;
  DELETE FROM PRODUCTOS;
   DELETE FROM CLIENTES;
    DELETE FROM CODIGOSPOSTALES;
     DELETE FROM OFERTAS;
      DELETE FROM FRANQUICIAS;
      
 INSERT INTO CODIGOSPOSTALES VALUES(41110,'Sevilla','Bollullos');
    
 EXECUTE PR_registrar_franquicia ('Optica Maguilla','C/Cristo de los gitanos,12','Jose Antonio');
    
 EXECUTE PR_registrar_cliente ('Optica Maguilla',41110,'Antonio','Osborne',TO_DATE('2012-06-05', 'YYYY-MM-DD'),'27283847E','Cocinero',777183927,'sss@sss.ss','Me he quedado tuerto de ir por la autopista a 180','C/Gustavo Adolfo Becquer, 32','Otro','https://asdasd.asda/asdasd.html','https://asdasd.asda/asdasd.html');
  EXECUTE PR_registrar_cliente ('Optica Maguilla',41110,'Alex','Osborne',TO_DATE('2012-06-05', 'YYYY-MM-DD'),'27283842F','Misterioso',777483927,'sss@sss.ss','Me he quedado tuerto de ir por la autopista a 180','C/Gustavo Adolfo Becquer, 32','Otro','https://asdasd.asda/asdasd.html','https://asdasd.asda/asdasd.html');
   EXECUTE PR_registrar_cliente ('Optica Maguilla',41110,'Jose','Osborne',TO_DATE('2012-06-05', 'YYYY-MM-DD'),'27583842X','Peluquero',677483927,'sss@sss.ss','Me he quedado tuerto de ir por la autopista a 180','C/Gustavo Adolfo Becquer, 32','Otro','https://asdasd.asda/asdasd.html','https://asdasd.asda/asdasd.html');
    EXECUTE PR_registrar_cliente ('Optica Maguilla',41110,'Fernado','Osborne',TO_DATE('2012-06-05', 'YYYY-MM-DD'),'27283647B','Profesor de iNgles',777883927,'sss@sss.ss','Me he quedado tuerto de ir por la autopista a 180','C/Gustavo Adolfo Becquer, 32','Otro','https://asdasd.asda/asdasd.html','https://asdasd.asda/asdasd.html');
     EXECUTE PR_registrar_cliente ('Optica Maguilla',41110,'Victor','Osborne',TO_DATE('2012-06-05', 'YYYY-MM-DD'),'27283817P','Nini',777083927,'sss@sss.ss','Me he quedado tuerto de ir por la autopista a 180','C/Gustavo Adolfo Becquer, 32','Otro','https://asdasd.asda/asdasd.html','https://asdasd.asda/asdasd.html');

 
 EXECUTE PR_registrar_lentilla('lentilla a',420 ,'5,7','0,2','0,3');
  EXECUTE PR_registrar_montura('montura a',420 ,'5,7','0,2','Metalica','Hombre');
   EXECUTE PR_registrar_lente('lente a',420 ,'5,7','0,2','12,5');
 
 
 EXECUTE PR_registrar_producto ('a',2 ,'5,7','0,2'); 
  EXECUTE PR_registrar_producto ('b',6 ,'5,7','0,2'); 
   EXECUTE PR_registrar_producto ('c',6 ,'2,1','0,2'); 
    EXECUTE PR_registrar_producto ('d',6 ,'5,7','0,2'); 
     EXECUTE PR_registrar_producto ('e',6 ,'7,7','0,2'); 
      EXECUTE PR_registrar_producto ('f',6 ,'5,7','0,2'); 
       EXECUTE PR_registrar_producto ('g',420 ,'5,7','0,2'); 
       
        


------------------------------------
--Presentar oferta / Eliminar oferta
 EXECUTE PR_presentar_Oferta('Verano en Sevilla',SEC_IDREFERENCIAPRODUCTO.CURRVAL,'0,2','Gafas fabricadas en Sevilla rebajadas','Optica Maguilla');
  EXECUTE PR_presentar_Oferta('Vision 2020',SEC_IDREFERENCIAPRODUCTO.CURRVAL - 1,'0,4','Gafas nuevas en oferta','Optica Maguilla');
  
   EXECUTE PR_presentar_Oferta('Rebajas Navideñas',SEC_IDREFERENCIAPRODUCTO.CURRVAL - 2,'0,5','Productos con variados descuentos','Optica Maguilla');

     EXECUTE PR_eliminar_Oferta('Rebajas Navideñas');






------------------------------------
--Añadir producto oferta / Eliminar producto oferta
 EXECUTE PR_añadirProducto_Oferta('Verano en Sevilla',SEC_IDREFERENCIAPRODUCTO.CURRVAL-3,'0,4','Gafas fabricadas en Sevilla rebajadas');
  EXECUTE PR_añadirProducto_Oferta('Vision 2020',SEC_IDREFERENCIAPRODUCTO.CURRVAL - 4,'0,3','Gafas nuevas en oferta');
--Error: Intentar añadir a una oferta un producto que ya está en otra
   EXECUTE PR_añadirProducto_Oferta('Vision 2020',SEC_IDREFERENCIAPRODUCTO.CURRVAL - 3,'0,3','Gafas nuevas en oferta cambiado');

    EXECUTE PR_eliminarProducto_Oferta(SEC_LINEASOFERTA.CURRVAL - 1);



 EXECUTE PR_realizar_encargo(SEC_CLIENTE.CURRVAL,SEC_IDREFERENCIAPRODUCTO.CURRVAL,417);
  EXECUTE PR_añadirProducto_encargo(SEC_IDREFERENCIAPRODUCTO.CURRVAL ,SEC_IDREFERENCIA_ENCARGO.CURRVAL,100);
   EXECUTE PR_EncargoRecibido(SEC_IDREFERENCIA_ENCARGO.CURRVAL);
    EXECUTE PR_Cancelar_Encargo(SEC_IDREFERENCIA_ENCARGO.CURRVAL);




------------------------------------
--Enviar oferta / Eliminar envio oferta
 EXECUTE PR_enviar_Oferta('Verano en Sevilla',SEC_CLIENTE.CURRVAL);
  EXECUTE PR_enviar_Oferta('Verano en Sevilla',SEC_CLIENTE.CURRVAL - 1);
   EXECUTE PR_enviar_Oferta('Vision 2020',SEC_CLIENTE.CURRVAL-2);

 SET SERVEROUTPUT ON;
 DECLARE
 prodBarato NUMBER;
 prodCaro NUMBER;
 ClientesNuevos NUMBER;

 BEGIN

     SELECT FN_prod_masBarato INTO prodBarato FROM DUAL;
     Select FN_nuevos_Clientes(TO_DATE('2019-01-01','YYYY-MM-DD'),SYSDATE) INTO ClientesNuevos From Dual;
     SELECT FN_prod_masCaro INTO prodCaro FROM DUAL;
     DBMS_OUTPUT.put_line('El producto mas caro es:        IdReferenciaProducto:' || prodCaro);
     DBMS_OUTPUT.put_line('El producto mas barato es:      IdReferenciaProducto:' || prodBarato);
     DBMS_OUTPUT.put_line('Numero de clientes nuevos:      Cantidad:' || ClientesNuevos);
   

 END;