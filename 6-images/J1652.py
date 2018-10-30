from astroplan.plots import plot_finder_image
from astroplan import FixedTarget
import matplotlib.pyplot as plt
from astropy.coordinates import SkyCoord
from astropy import units as u
from matplotlib.patches import Rectangle


c = SkyCoord('16 52 38.52 -19 09 41.7', unit=(u.hourangle, u.deg))
c1 = SkyCoord('16 52 39.48 -19 09 46.5', unit=(u.hourangle, u.deg))
c2 = SkyCoord('16 52 39.99 -19 09 40.3', unit=(u.hourangle, u.deg))
c3 = SkyCoord('16 52 39.49 -19 09 32.458', unit=(u.hourangle, u.deg))

plt.ion()
ax, hdu = plot_finder_image(c,fov_radius=1*u.arcmin)

# Pot main
ax.scatter(c.ra.deg-0.0005, c.dec.deg, transform=ax.get_transform('fk5'), s=2000,edgecolor='red', facecolor='none')
ax.text(c.ra.deg-100, c.dec.deg+120, 'J1652$-$13\n$G$ = 12.4132')


ax.scatter(c1.ra.deg-0.0005, c1.dec.deg, transform=ax.get_transform('fk5'), s=1000,edgecolor='red', facecolor='none')
ax.text(c.ra.deg-180, c.dec.deg+115, '$G$ = 15.7474')

ax.scatter(c2.ra.deg-0.0005, c2.dec.deg, transform=ax.get_transform('fk5'), s=1000,edgecolor='red', facecolor='none')
ax.text(c.ra.deg-240, c.dec.deg+140, '$G$ = 16.69')



ax.scatter(c3.ra.deg-0.0005, c3.dec.deg, transform=ax.get_transform('fk5'), s=1000,edgecolor='red', facecolor='none')
ax.text(c.ra.deg-180, c.dec.deg+240, '$G$ = 15.7474')

# Now draw K2 box

r = Rectangle((c.ra.deg-0.0005 - 0.00375, c.dec.deg - 0.004), 0.009, 0.009, edgecolor='green', facecolor='none',
              transform=ax.get_transform('fk5'))
ax.add_patch(r)
ax.text(c.ra.deg-110, c.dec.deg+85, 'Y pixel', color='g')
ax.text(c.ra.deg-20, c.dec.deg+180, 'X pixel', color='g', rotation = 270)
plt.savefig('J1652.png')
#plt.show()
