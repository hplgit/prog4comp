import matplotlib.pyplot as plt
import numpy as np

xc = yc = 2
R = 1
dx = dy = 0.3
x0 = xc - R - dx
y0 = yc - R - dy
x1 = xc + R + dx
y1 = yc + R + dy

theta = np.linspace(0, 2*np.pi, 801)
x = xc + R*np.cos(theta)
y = yc + R*np.sin(theta)
plt.plot(x, y, 'r-', linewidth=3)
plt.plot([x0, x1], [y0, y0], 'b-')
plt.plot([x0, x1], [y1, y1], 'b-')
plt.plot([x0, x0], [y0, y1], 'b-')
plt.plot([x1, x1], [y0, y1], 'b-')
n = 500
rx = np.random.uniform(x0, x1, n)
ry = np.random.uniform(y0, y1, n)
plt.plot(rx, ry, 'ko')
plt.axes().set_aspect((y1-y0)/float(x1-x0))
plt.savefig('tmp.png')
plt.savefig('tmp.pdf')
plt.show()
