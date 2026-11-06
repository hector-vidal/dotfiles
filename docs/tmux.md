# tmux

[tmux](https://github.com/tmux/tmux) es el multiplexor de terminal: sesiones, ventanas y paneles que siguen vivos al
cerrar la terminal. La configuración de este repositorio es mínima a propósito: solo lo que necesitan las demás
herramientas.

## Instalación

Elemento de akmon: `tmux`.

| Archivo del repositorio | Destino |
|---|---|
| `common/.config/tmux/tmux.conf` | `~/.config/tmux/tmux.conf` |

```bash
brew install tmux         # macOS
sudo apt install tmux     # Debian/Ubuntu
```

tmux lee `~/.config/tmux/tmux.conf` si no existe `~/.tmux.conf`. Con una sesión abierta, los cambios se cargan con
`tmux source-file ~/.config/tmux/tmux.conf`.

## Qué configura este repositorio

| Ajuste | Para qué |
|---|---|
| `default-terminal "tmux-256color"` y `terminal-features ",*:RGB"` | Color de 24 bits: el tema Dracula de bat, delta y fzf se ve igual que fuera de tmux |
| `terminal-features ",*:hyperlinks"` | Enlaces OSC 8 clicables, como los de [delta](delta.md) |

## Documentación oficial

- [Manual de tmux](https://man.openbsd.org/tmux): opción `terminal-features`.
- [Preguntas frecuentes de tmux](https://github.com/tmux/tmux/wiki/FAQ): color de 24 bits.
