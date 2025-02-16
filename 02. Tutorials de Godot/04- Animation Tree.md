---
title: Godot. Animation Tree
titlepage: false
subtitle: 
author: Ricardo Sánchez
lang: ca
toc: true
toc-own-page: true
linkcolor: magenta
listings-no-page-break: true
header-includes: \usepackage{lastpage}
header-left: Godot. Animation Tree
header-right: Curs 2024-2025
footer-left: IES Jaume II el Just - DWES
footer-right: \thepage/\pageref{LastPage}
---

# Animation Tree

En aquest tutorial utilitzarem el node `AnimationTree` per a crear un arbre com a màquina d'estats per a gestionar millor les nostres animacions.

En primer lloc afegim un nou node de tipus **`AnimationTree`** a l'escena **Player**. 

Una vegada afegit seleccionem el nou node i, a l'inspector, afegim a *Tree root* un nou **AnimationNodeStateMachine**. Per últim arrosseguem el nostre node **AnimationPlayer** a la propietat *Anim player* de l'inspector:

![Animation tree, propietats](images/anim_tree_inspector.png)

Al panell inferior, seleccionem *AnimationTree*, i afegim l'animació idle: botó dret del ratolí *-> Add animation -> idle*. Després afegim una transició des de *Start* a *idle*:

![Transició](images/animation_panell.png)




