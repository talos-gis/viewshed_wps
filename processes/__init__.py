from .wps_sayhello import SayHello
from .wps_crop_color import GdalDem
from .wps_invert import Invert
from .wps_viewshed import ViewShed
from .wps_ls import ls
from .buffer import Buffer
from .jsonprocess import TestJson

# For the process list on the home page
processes = [
    SayHello(),
    Invert(),
    ViewShed(),
    TestJson(),
    Buffer(),
    GdalDem(),
    ls()
]