# HealthKit : An apple a day keeps the doctor away
## Información General
El objetivo de esta PoC será el de conocer las funcionalidades que ofrece el framework HealthKit de Apple, así como casos reales de éxito y posibles usos dentro de la compañía.

#### v1.0

#### Autores
[Adrián Vegas](mailto:adrian.vegas.next@bbva.com)

#### TRIBU Mobile XX-10-2019

#### iOS, Health, Framework

## Introducción
HealthKit ofrece una serie de herramientas para poder comunicarte con la aplicación Health(Salud) accediendo y compartiendo información.

De esta manera una aplicación desarrollada con HealthKit podría recuperar los datos de peso y actividad física del usuario para definir objetivos de consumo de calorías o hacer recomendaciones dietéticas, a la vez que podría aportar datos sobre el consumo de calorías del usuario para que Health muestre por ejemplo métricas de progreso global que a su vez puede compartir con otras Apps.
[Documentación oficial](https://developer.apple.com/documentation/healthkit)

### Objetivo

 El objetivo de esta PoC será el de conocer las funcionalidades que ofrece el framework HealthKit de Apple, así como casos reales de éxito y posibles usos dentro de la compañía.

### Estado del arte

```
> Esta sección trata de contextualizar la tecnología usada/evaluada en esta PoC dentro de tecnologías similares en el mercado. Información de cuándo aparecieron, trends de uso, popularidad, desarrollo, versiones disponibles, se identificarán tecnologías similares que pueden pertenecer o no al radar de la compañía
```

Anunciado en la WWDC (Worldwide Developers Conference) de **2014**, fue incluido en el SDK de iOS para Mac, con el propósito de proporcionar las herramientas necesarias para acceder al repositorio central de datos de salud y estado físico en iPhone y Apple Watch que ofrece la aplicación**Health**  también presentada ese mismo año.    

Actualmente disponible para su uso en apps que utilicen iOS 8.0 o superior, Mac Catalyst 13.0 o superior y watchOS 2.0 o superior.

Según datos de Apple ya hay más de 70000 apps categorizadas como salud y fitness en la App Store, algunas de las más destacadas son : 

* Nike Run Club
* Clue
* Runkeeper
* Garmin Connect
* AutoSleep
* Pokemon GO

A día de hoy HealthKit añade un plus a los dispositivos inteligentes relacionados con la actividad física ya que además de los ya más que conocidos relojes o pulseras inteligentes, podemos encontrar cada vez más productos como la [KettlelbellConnect](https://www.apple.com/shop/product/HNHM2ZM/A/jaxjox-kettlebellconnect?fnode=4a) o el casco inteligente [Lumos Smart Bike Helmet ](https://www.apple.com/shop/product/HLXM2VC/A/lumos-bike-helmet?fnode=4a) .  [Catálogo completo](https://www.apple.com/shop/iphone/iphone-accessories/health-fitness)  de accesorios de salud y fitness de Apple.

El principal competidor de HealthKit no podría ser otro que su homologo en Android, Google Fit también presentado y lanzado en 2014. El framework de Google también cuenta con aplicaciones muy populares, como en  iOS podemos encontrar que las principales marcas deportivas han desarrollado sus apps utilizando este framework algunos ejemplos son Nike Run Club, Runtastic(Adidas) o Under Armour control.

5 años después de su lanzamiento, HealthKit sigue siendo un framework muy vivo y que presenta actualizaciones año trás año como se pudo ver en la WWDC de 2019, donde presentaron novedades  en el modelo de datos, nuevas APIS para cuantificar repeticiones (Quantity series) o como recopilar información sobre el ritmo cardiaco usando en apps para apple watch.([WWDC 2019 - Apple Developer - HealhtKit](https://developer.apple.com/videos/play/wwdc2019/218/))


## Material
> En esta sección tiene que describirse todo el material utilizado para cualquier parte de la PoC.  

> * Plataforma cloud  
> * PC donde se ha probado (características técnicas)  
> * Cuentas de APIs necesarias  
> * Datos de prueba (y dónde conseguirlos mediante link directo)  

Para está PoC únicamente  ha sido necesaria la utilización del portátil corporativo, MacBook Pro ( Early 2015, 2,7 GHz Intel Core i5, 16GB Memoria RAM) y conexión a internet .
 Las aplicaciones han corrido sobre el emulador de IPhone de Xcode.


## Métodos
> En esta sección se describe la metodología de la PoC:* Experimentos al menos una tecnología de las categorías Core o Adoptar con la que comparar (si no es posible, en esta sección se debe especificar por qué)* Diseño de la planteados para probar la tecnología  
> * Se seleccionará metodología de evaluación si se va a comparar con otra tecnología diferente  
> * Procedimientos para montar la infraestructura necesaria  
> * Procedimientos para crear cuentas necesarias  

Se ha estudiado el framework HealthKit de Apple para iOS, desarrollando varias aplicaciones en las que se han probado sus principales características.
Se ha comparado con el framework  Google Fit, su principal competidor.

## Resultados
> En esta sección se describen (sin comentarios de valor, o juicios) los resultados obtenidos.* Scripts de terraform* Código evaluado  
> * Tiempos de ejecución  
> * Precisión de algoritmos  
> * Gráficos de resultados  

> Si se ha generado código durante la evaluación, se describirá en una sección cómo reproducir exactamente los resultados de la poc ya sea por pasos a seguir, como comandos a usar y archivos dentro del repositorio.  

Proyecto HealthKitQuickStart : 
[Repositorio](https://github.com/next-adrianvegas/Poc-HealthKit/tree/master/code_examples/HealthKitQuickStart)

En este tutorial en la web raywenderlich.com se ha tomado un proyecto creado con distintos  ‘TODO’ repartidos por el código, donde se han resuelto las siguientes funcionalidades del framework  :

* Petición de permisos al usuario
* Leer información del usuario desde la App _Salud_ 
* Persistir información desde HealthKit
* Realizar una media de datos dado un período de tiempo para su visualización en la App  _Salud_ 

Proyecto HealthKitWorkoutApp :
 [Repositorio](https://github.com/next-adrianvegas/Poc-HealthKit/tree/master/code_examples/HealthKitWorkoutApp)

En este proyecto se hace uso de las siguientes funcionalidades de HealthKit : 

* Petición de permisos al usuario
* Lectura /  Escritura datos en health
* Manejo de distintas unidades en función del tipo de ejercicio
* Manejo de datos en UI 
* Uso del framework en una app para Apple Watch 

## Código generado
> En esta sección deberán incluirse todos los links al código generado de la PoC.  

* [HealthKitQuickStart](https://github.com/next-adrianvegas/Poc-HealthKit/tree/master/code_examples/HealthKitQuickStart)
* [HealthKitWorkoutApp for Apple Watch](https://github.com/next-adrianvegas/Poc-HealthKit/tree/master/code_examples/HealthKitWorkoutApp)

### Costes
> En esta sección de resultados se deben especificar los costes de la PoC, tanto en infraestructura como en tiempo de realización.  

En esta PoC se han dedicado  unas 15 horas.

## Discusión
> En esta sección se comentan los resultados uno a uno, se discuten las comparativas. Es aquí donde debe ir TODO juicio de valor de quien lo escribe, opiniones, etc. En esta sección se deberá revisar el triángulo: tiempo-alcance-incertidumbre con el objetivo de resolver las conclusiones de la última sección.  

Como resultado de la PoC puedo decir que es un framework bastante completo en su ámbito que además sigue presentando mejoras año tras año y actualizándose acorde al crecimiento del lenguaje Swift y el desarrollo mobile en general.
Realmente se trata de un framework por definición sencillo, aunque a veces en su desarrollo se complique en el manejo de muchos tipos de unidades, ofrece las herramientas necesarias para crear aplicaciones o funcionalidades y sobretodo para compartir datos entre ellas de forma que estos datos sean de interés para el usuario. 

### Limitaciones
> En esta sección se describen las limitaciones de la PoC:* Cosas que no se han podido probar (por qué no se ha probado, el alcance de tu trabajo y de tus conclusiones)* Evaluaciones que no se han realizado y que molaría hacer (futuras PoCs?)  
> * Limitaciones de la tecnología: Las limitaciones propias de la tecnología deberán discutirse en Discusión y en Resultados así como derivar en conclusiones.  

Me habría gustado probar la implementación de HealthKit en una App existente, añadiendo una funcionalidad relacionada con el estilo de vida saludable, no lo he realizado porque considero en parte no es el objetivo de esta PoC, además de por la complejidad de la que podía requerir esta implementación, pero al fin y al cabo sería lo más parecido a ofrecer un caso real de uso a nuestra compañía. 

### Ejemplo de caso de uso
> En esta sección se discute, a la vista de resultados, una posible aplicación dentro de [BBVA Next Technologies](https://www.bbvanexttechnologies.com/) de la(s) tecnología(s) evaluada(s). No es necesario implementarla, sino dar idea de utilidades posibles de la tecnología  


#### Costes
> Aquí se deben describir los costes del supuesto caso de uso. Pueden ser aproximados, pero en líneas generales deben dar una idea de las posibilidades de la tecnología desde el punto de vista económico.  


## Conclusiones
> En esta sección deben estar todas las conclusiones del trabajo. **Cuidado con realizar especulaciones**, es importante que sean conclusiones que deriven directamente del trabajo realizado y de la tecnología: pros y contras así como limitaciones de implantación. Es importante que en las conclusiones aparezcan ventajas y desventajas de la tecnología como resultado de la PoC  
>   
El **mercado** está bastante **saturado** de productos que ofrecen un control sobre **buenos hábitos** o un registro sobre **actividades físicas**, sin embargo dado que la implementación del framework y su uso es bastante sencillo y que se apoya sobre un marco de datos bastante amplio, resultaría bastante sencillo implementar una funcionalidad relacionada con hábitos saludables o ejercicio físico en cualquier tipo de aplicación, como comento en el punto anterior “casos de uso”.
