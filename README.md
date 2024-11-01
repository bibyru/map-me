## 📔 Game Description
![Gif of Trash Grabbers gameplay](https://github.com/bibyru/bibyru/blob/main/Gifs/MapMe.gif)

**Map Me!** is a 2D point and click serious game. **Map Me!**, as a serious game, has the goal of promoting Indonesian tourist destinations. Players click at dots on one of the Indonesian islands to locate the tourist destination.

Download game [here](https://drive.google.com/file/d/1B9J-vQRz8U3bqxgLN-w2LG2SSQwbhPXB/view).

<br/>

## 🎮 Game Controls
This game uses mouse and keyboard inputs.
| **Action** | **Key binding** |
| :- | :- |
| Mouse | Move cursor |
| LMB | Select |
| Esc | Options menu |

<br/>

## 📝 Project Info
This project was developed using Godot v4.2.2.
| **Role** | **Credit** | **Development Time** |
| :- | :- | :- |
| Game programmer | bibyru (Ruby) | 3 days |
| Project lead | bibyru (Ruby) | 5 days |
| Visual designer | bibyru (Ruby) | 2 day |
| Game designer | bibyru (Ruby) | 1 day |
| Sound designer | bibyru (Ruby) | 1 day |

<br/>

## ⭐ Scripts and Features
| **Script** | **Description** |
| :- | :- |
| `checkbutton.gd` | Script for ToggleButton to change states (on or off). |
| `dot.gd` | Script for Dot objects to change states (hovered on or not) and call a `map_jawa.gd` function. |
| `manager.gd` | Singleton script to detect input and show options menu. |
| `map_full.gd` | Script for the full map to detect which island is selected. |
| `map_jawa.gd` | Script for the jawa map to change displayed city name. |
| `map_jawa.gd` | Script for the jawa map to change displayed city name. |
| `options.gd` | Script for options menu to manage its buttons. |
| `prompt.gd` | Script for prompt to set query pictures and check answers. |
| `startbutton.gd` | Script for Button to animate when pressed. |
| `world.gd` | Script for main menu to manage its buttons. |
| `citiesJawa.gd` | Arrays of provinces in Jawa and its cities. |
| `destsJawa.gd` | Script to initialize arrays of data containing query picture paths. |

<br/>

## 📁 File Description
```
├── MapMe
    ├── Prefabs    # for objects used in a level
        ├── Prompt    # for prompt objects for each island
    ├── Sauce      # for game assets
        ├── Photos    # stores all tourist destination photos
            ├── 1        # for tourist destination photos in island #1 (Jawa)
        ├── Sprites   # stores sprites used in the game
        ├── Theme     # stores UI used in the game
    ├── Scenes    # for level management
    ├── Scripts   # for game scripts
        ├── Data      # stores data of each island and its destinations
```

<br/>

## 💿 How to Open in Game Engine
1. Download all files.
2. Extract to **Folder A** (an empty folder).
3. Launch Godot v4.1.2.
4. Press **Import** and select `project.godot` in **Folder A**.
