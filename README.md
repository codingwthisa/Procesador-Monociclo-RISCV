# Procesador-Monociclo-RISCV
El procesador monociclo realiza ejecución de instrucciones en forma secuencial, una por ciclo de procesador. Este procesador cuenta con diferentes módulos que permiten ejecutar diferentes tareas, como por ejemplo la lectura de registros o la suma entre dos operandos. 

<img width="1136" alt="image" src="https://github.com/codingwthisa/Procesador-Monociclo-RISCV/assets/106448788/59b7fb48-054e-42c9-8b1c-ef291f3374a5">

# Contador de Programa
Este módulo se encarga de recibir la dirección de la instrucción a ejecutar en el ciclo del reloj y la mantiene por ese periodo de tiempo.
<img width="313" alt="image" src="https://github.com/codingwthisa/Procesador-Monociclo-RISCV/assets/106448788/8aa0d7b6-49f1-431c-a4fe-44519916ed5a">

# Memoria de instrucciones 
La memoria de instrucciones en un procesador tiene la función de retornar la instrucción que se le solicita para ser ejecutada. Esta memoria recibe como entrada una dirección específica que apunta a la memoria de instrucciones, de la cual se recupera el dato que finalmente es retornado por la salida _instruction_.

<img width="313" alt="image" src="https://github.com/codingwthisa/Procesador-Monociclo-RISCV/assets/106448788/439face6-845f-4753-ad44-25d31ecba0c3">

# Unidad de Control
La unidad de control interpreta las instrucciones del programa y genera las señales de control necesarias para ejecutar esas instrucciones. Coordina el flujo de datos y controla la secuencia de ejecución de las instrucciones, asegurando que se realicen en el orden correcto y que los datos se procesen de manera adecuada.

<img width="488" alt="image" src="https://github.com/codingwthisa/Procesador-Monociclo-RISCV/assets/106448788/580fef7c-d375-4fa2-a80b-d4527c2d0931">

A continuación se presentan tres tablas que condensan todas las señales de control generadas para los módulos que componen el diseño del procesador monociclo:

<img width="600" alt="image" src="https://github.com/codingwthisa/Procesador-Monociclo-RISCV/assets/106448788/4debcacf-3a89-4f83-9df9-8d6c9997bfed">

<img width="563" alt="image" src="https://github.com/codingwthisa/Procesador-Monociclo-RISCV/assets/106448788/1881ccb7-cce3-47ba-a63b-3544fadcc4b3">

<img width="485" alt="image" src="https://github.com/codingwthisa/Procesador-Monociclo-RISCV/assets/106448788/a20f3ee3-b2e7-4430-a322-05a0dc6364af">

# Unidad de Registros

La unidad de registros en un procesador RISC-V es responsable de almacenar y gestionar los registros del procesador. Los registros son ubicaciones de almacenamiento de alta velocidad integradas directamente en el procesador y se utilizan para almacenar datos temporalmente durante la ejecución de instrucciones.

La unidad de registros puede realizar varias funciones importantes:

1. **Almacenamiento de datos:** Los registros son utilizados para almacenar datos que se están procesando actualmente en el procesador. Estos pueden incluir datos, direcciones de memoria, resultados parciales de cálculos, punteros a datos, etc.

2. **Transferencia de datos:** La unidad de registros facilita la transferencia de datos entre diferentes partes del procesador, como entre la unidad de ejecución y la memoria, entre la unidad de ejecución y la unidad de almacenamiento, o entre diferentes unidades funcionales dentro del procesador.
   
3. **Gestión del contexto:** Los registros también se utilizan para almacenar información sobre el estado del programa y el estado del procesador en general. Esto puede incluir registros de estado, registros de control de excepciones, punteros de pila, contadores de programa, etc.

4. **Operaciones de datos:** La unidad de registros puede realizar operaciones básicas en los datos almacenados en los registros, como la suma, resta, comparación, desplazamiento, operaciones lógicas, etc. Estas operaciones se realizan utilizando la unidad aritmético-lógica (ALU) junto con los datos almacenados en los registros.
<img width="500" alt="image" src="https://github.com/codingwthisa/Procesador-Monociclo-RISCV/assets/106448788/eece4edb-6fc9-4e05-b181-2152cb636292">

