Code Scenario Requirements; Please make sure candidates are running their code to ensure it works before submitting.

Base Car Class

+ current speed (property) – default value 0

+ accelerate (method)

+ drive (method)

+ brand (property) - default value ‘unknown’

+ max speed (property) - default value 0

Camaro Car Class

+ Inherits Base Car

+ brand (property) - default value ‘Chevy’

+ max speed (property) – default value 200

Code Scenario:

In this example we will create an instance of Camaro and tell it to drive, we will assume it’s moving in a straight line and there are no other driving factors.  The car will accelerate until it hits its max speed.  It is required that drive will call accelerate. It is required accelerate will increment the current speed by 1.  Once the Camaro reaches max speed it should stop accelerating and print that it hit the cars max speed.  The execution of drive should then also stop