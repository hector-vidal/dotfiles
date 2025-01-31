# Dotfiles

Este repositorio contiene mi configuración personal de herramientas de terminal para mantener un entorno de desarrollo consistente y productivo.

## 🛠️ Herramientas Incluidas

### WezTerm
[WezTerm](https://wezfurlong.org/wezterm/) es un emulador de terminal multiplataforma, GPU-acelerado, desarrollado en Rust. Mi configuración incluye:
- Configuración personalizada de temas y colores
- Atajos de teclado optimizados
- Ajustes de fuente y diseño

### Zsh
[Zsh](https://www.zsh.org/) es un shell diseñado para uso interactivo que incorpora muchas características útiles de otros shells. En este repositorio encontrarás:
- Archivo `.zshrc` con mi configuración personal
- Aliases personalizados
- Funciones útiles para el día a día

### Oh-My-Zsh
[Oh-My-Zsh](https://ohmyz.sh/) es un framework para gestionar la configuración de Zsh. Mi setup incluye:
- Lista de plugins instalados y su configuración
- Tema seleccionado y personalizaciones
- Configuraciones específicas de plugins

### Starship
[Starship](https://starship.rs/) es un prompt minimalista, rápido y personalizable para cualquier shell. Aquí encontrarás:
- Archivo `starship.toml` con mi configuración
- Personalización de símbolos y estilos
- Módulos activados y su configuración

## 📦 Instalación

1. Clona este repositorio:
```bash
git clone https://github.com/[tu-usuario]/dotfiles.git
cd dotfiles
```

2. Crea enlaces simbólicos a los archivos de configuración:
```bash
ln -s $(pwd)/wezterm ~/.config/wezterm
ln -s $(pwd)/zsh/.zshrc ~/.zshrc
ln -s $(pwd)/starship/starship.toml ~/.config/starship.toml
```

## ⚙️ Personalización

Siéntete libre de explorar y adaptar estas configuraciones a tus necesidades. Cada herramienta tiene su propia carpeta con documentación específica sobre las personalizaciones realizadas.


## 📫 Contacto

¡Me encantaría conocer cómo utilizas estas configuraciones! Si estás interesado en otros proyectos en los que trabajo, te invito a revisar mis otros repositorios. También puedes contactarme a través de mi perfil de [LinkedIn](https://www.linkedin.com/in/hz-eduardo-vidal/).

## 📝 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.
