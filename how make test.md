## **Testiar contracto inteligente**
Documentacion aqui https://trufflesuite.com/docs/truffle/testing/testing-your-contracts.html 

</br>

**Paso 1**
Debemos crear un archivo dentro de la carpeta migrations. Ya dentro de esa carpeta debe existir un archivo que lo podemos usar como ejemplo. 

</br>

**Paso 2**
Vamos al archivo truffle-config y descomentamos el json development. Vamos a poner el puerto de Ganache, usualmente usa el puerto: 7545  
El network_id lo podemos dejar con el * o le ponemos el network_id de ganache que usualmente es 5777

</br>

**Paso 3**
el archivo truffle-config hay otro Json de compilers vamos a descomentarlo y descomentar la version, en la version pondremos la version que estamos usando

</br>

**Paso 4**
Vamos a compilar el codigo y a subir el codigo. Cuando decimos subir, es que vamos a subirlo a la red de pruebas ganache. Para esto debemos ejecutar el siguiente comando

```
truffle deploy
```
Esto nos creara una carpeta build, tambien nos mostrara cuando deploy hicimos, si dejamos el archivo de ejemplo que crea truffle, entonces hara 2 deploys y tambien nos muestra el valor que cuesta en ETH hacer ese deploy.