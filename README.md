<div align="center">
	<img src="icon.svg" alt="Logo" width="160" height="160">

<h3 align="center">Transform Container</h3>

  <p align="center">
	Make transformative animations in ui easier.
  </p>
</div>

# How To Use
1. Add the new **Transform Container** as the parent of the UI element you want to animate.
2. Set/Animate the properties of the **Transform Container** to change the children's size, position, rotation, scale, or pivot offset.

# Notes
- Changing the properties of the **Transform Container** will respect the minimum size of it's children, which can prevent the size property from lowering.
- The **Transform Container** still acts as a normal container, meaning a change in size of it's children will force it to grow and shrink even when visually it is disconnected.
- The **Visual Pivot Offset Perc** is based on a percentage of the size of it's children, rather than a pixel measurement. This makes it more convenient to center the pivot along different sized ui elements. There may be an option for pixel measurements if people would like that.
