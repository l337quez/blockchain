# Blockchain y la Web 3.0
Mis apuntes sobre blockchain

 
### Índice 
* [Que es la Blockchain](#Blockchain)
* [Que es la Web 3.0](#web3)
* [Que son Dapps](#dapps)
* [Requerimientos para Ethereum en GNU Linux ARCH](#req_ethereum)
* * [Que es Truffle](#Truffle)
* * [Hacer Test con Truffle](#testTruffle)
* * [Que es Ganache](#ganache)
* * [Que es Hardhat](#hardhat)




 <br/>
 
  <a name="Blockchain"></a>
### **Que es la Blockchain**
 Es de un conjunto de tecnologías que permiten llevar un registro seguro, descentralizado, sincronizado y distribuido de las operaciones digitales, sin necesidad de la intermediación de terceros.


</br>

  <a name="web3"></a>
### **Que es la Web 3.0**
Web 3.0 o web semántica es una expresión que se utiliza para describir la evolución del uso y la interacción de las personas en internet a través de diferentes formas entre las que se incluyen la transformación de la red en una base de datos, un movimiento social con el objetivo de crear contenidos accesibles por múltiples aplicaciones non-browser (sin navegador), el empuje de las tecnologías, de inteligencia artificial, la web semántica, la Web Geoespacial o la Web 3D. La expresión es utilizada por los mercados para promocionar las mejoras respecto a la Web 2.0. Esta expresión Web 3.0 apareció por primera vez en 2006 en un artículo de Jeffrey Zeldman, crítico de la Web 2.0 y asociado a tecnologías como AJAX. Actualmente existe un debate considerable en torno a lo que significa Web 3.0, y cuál es la definición más adecuada.1

</br>

 <a name="dapps"></a>
### **Que son Dapps**
Son aplicaciones descentralizadas que utilizan ‘blockchain’ para que los usuarios se relacionen directamente entre ellos y cierren acuerdos sin que exista una entidad central que gestione el servicio.  
En esta pagina encontrars proyectos de aplicaciones descentralizadas
https://ethereum.org/en/dapps/#explore

</br>

 <a name="req_ethereum"></a>
### **Requerimientos para Ethereum en ARCH Linux**
Instalamos el compilador de solidity
```
sudo pacman -S solidity
```

</br>

**Ethereum Remix editor Online para Solidity**  
Editor Online, que proporciona una blockchain de prueba
https://remix.ethereum.org/#optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.7+commit.e28d00a7.js  
Si quieres una version instalable
https://github.com/ethereum/remix-desktop/releases

</br>

**Version Ethereum Remix para Vscode**  
Hay una version para vscode se llama Ethereum Remix


</br>

  <a name="Truffle"></a>
### **Que es Truffle**
Framework Truffle (Trufa, en español) es un conjunto de herramientas que permite a los desarrolladores crear aplicaciones sostenibles y profesionales en cualquier blockchain utilizando la Máquina Virtual Ethereum (Ethereum Virtual Machine, EVM). Podemos instalar trueffle desde el repositorio AUR. mas informacion aqui https://trufflesuite.com/


* Proporciona un entorno para el desarrollo, integración y producción de aplicaciones.
* Proporciona una forma automatizada de probar contratos inteligentes.
* Los entornos de desarrollo, integración y producción pueden configurarse para que puedan reutilizarse.
* Permite a los desarrolladores codificar en idiomas que ya dominan.
* Gestión de redes para que le permite desplegar  tanto en redes públicas como privadas.  

```
yay -S truffle
```

Pero tambien lo podemos instalar desde npm de forma global
```
npm install truffle -g
```
Para comenzar con truffle es algo parecido a npm
* Cuando comenzamos un proyecto debemos tipear el siguiente comando
```
truffle init
```
* Para compilar y crear la carpeta build
```
truffle compile
```
* Para unicamente levantar el contracto
```
truffle migrate
```
* Para hacer deploy. Bueno el deploy compila y luego sube. Es importante hacer unas configuraciones antes
[Configuracion para el deploy](https://github.com/l337quez/blockchain/blob/main/how%20make%20deploy.md) 
```
truffle deploy
```

* Reiniciar y volver a ejecutar el contracto
```
truffle migrate --reset
```
* Para interectuar con los contractos desde la terminal  
```
truffle console
```
Podremos intereactuar con el contracto despplegado o deployado. Si nuestro contracto se llama TasksContract lo podremos guardar de esta manera en una variable  
 <br/>

TasksContract = await TasksContract.deployed()  

 <br/>

**Direccion del Contracto en mi Blockchain**
Ya tenemos la clase instanciada, esta tiene una propiedad llamada address, donde podremos ver la direccion del contrato

<br/>

TasksContract.address

<br/>

Ya hemos instanciado en la consola de Truffle la clase TasksContract de nuestro contracto, ahora podemos ingresar a sus metodos o variables siempre y cuando sean **public**. Podemos hacer uso del metodo await cuando es un proceso asincrono.  
Vamos a ingresar a la variable task que es un mapping, ya tenemos instanciado la clase en una variable llamada TasksContract, entonces usamos esa instancia creada. Pero como es un mapping esto no puede retornar todo lo que tenga, hay que enviar un numero que indicaria la posicion en la structura.

 <br/>

 tasks = await TasksContract.tasks(0)  

  <br/>

 Truffle tiene una estructura de directorios, en la carpeta contracts vamos a escribir los contractos. Recordemos que en la blockchain no existe una base de datos sql o nosql, sino que la misma blockchain es una base de datos, entonces si queremos hacer una migracion para subir algun contracto inteligente, eso lo debemos hacer dentro de la carpeta de migrations. Dentro de la carpeta test vamos agregar los testing de nuestro smarth contract.

<br/>

<br/>

  <a name="testTruffle"></a>
### **Hacer Test con Truffle**
Los test son muy importantes porque todo cuesta dinero, asi que antes de subir el contracto debemos probarlo muy bien.  [Apartado de Testing](https://github.com/l337quez/blockchain/blob/main/how%20make%20test.md) 

<br/>

  <a name="ganache"></a>
### **Que es Ganache**
Truffle ofrece una red de Ethereum local desde consola, como tambien desde una interface grafica llamafa ganache. Basicamente es una red de pruebas que se puede desplegar localmente. Tambien esta disponible ganache en el rpositorio AUR.
```
yay -S ganache-bin
```
Si no deseamos instalar la aplicacion que es de forma visual, sino que deseamos instalar la version consola de la red ganache, entonces instalamos el siguiente paquete
```
npm install -g ganache-cli
```
mas informacion aqui: https://www.npmjs.com/package/ganache-cli


</br>


<a name="hardhat"></a>
### **Que es Hardhat**
Es otro framework para solidity, es un poco mas completo que truffle, para mas informacion 
https://hardhat.org/
