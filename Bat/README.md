# BAT Dracula Theme Line Numbers Fix

Una solución para corregir la visualización incorrecta de los números de línea cuando se usa el tema Dracula en [BAT](https://github.com/sharkdp/bat), el clon de `cat` con alas.

## Problema

Cuando se utiliza el tema Dracula en BAT, los números de línea no se muestran correctamente, lo que puede dificultar la lectura y navegación del código.

## Solución

La solución consiste en modificar la configuración de color en el archivo del tema Dracula que utiliza BAT, específicamente ajustando el color del texto en el margen (gutter) donde se muestran los números de línea.

## Pasos de Instalación

1. Crear el directorio de temas de BAT:
```bash
mkdir -p "$(bat --config-dir)/themes"
```

2. Navegar al directorio de temas:
```bash
cd "$(bat --config-dir)/themes"
```

3. Clonar el repositorio del tema Dracula para TextMate:
```bash
git clone git@github.com:dracula/textmate.git
```

4. Modificar el archivo del tema:
   - Abrir el archivo del tema Dracula
   - Localizar la sección `<key>settings</key>`
   - Agregar la siguiente configuración dentro de la sección:
```xml
<key>gutterForeground</key>
<string>#b0b0b0</string>
```

5. Reconstruir el caché de BAT para aplicar los cambios:
```bash
bat cache --build
```

## Verificación

Para verificar que los cambios se aplicaron correctamente:
1. Abra un nuevo archivo con BAT
2. Los números de línea deberían ser claramente visibles en un color gris (#b0b0b0)