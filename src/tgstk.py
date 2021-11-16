# This file was automatically generated by SWIG (http://www.swig.org).
# Version 4.0.2
#
# Do not make changes to this file unless you know what you are doing--modify
# the SWIG interface file instead.

from sys import version_info as _swig_python_version_info
if _swig_python_version_info < (2, 7, 0):
    raise RuntimeError("Python 2.7 or later required")

# Import the low-level C/C++ module
if __package__ or "." in __name__:
    from . import _tgstk
else:
    import _tgstk

try:
    import builtins as __builtin__
except ImportError:
    import __builtin__

def _swig_repr(self):
    try:
        strthis = "proxy of " + self.this.__repr__()
    except __builtin__.Exception:
        strthis = ""
    return "<%s.%s; %s >" % (self.__class__.__module__, self.__class__.__name__, strthis,)


def _swig_setattr_nondynamic_instance_variable(set):
    def set_instance_attr(self, name, value):
        if name == "thisown":
            self.this.own(value)
        elif name == "this":
            set(self, name, value)
        elif hasattr(self, name) and isinstance(getattr(type(self), name), property):
            set(self, name, value)
        else:
            raise AttributeError("You cannot add instance attributes to %s" % self)
    return set_instance_attr


def _swig_setattr_nondynamic_class_variable(set):
    def set_class_attr(cls, name, value):
        if hasattr(cls, name) and not isinstance(getattr(cls, name), property):
            set(cls, name, value)
        else:
            raise AttributeError("You cannot add class attributes to %s" % cls)
    return set_class_attr


def _swig_add_metaclass(metaclass):
    """Class decorator for adding a metaclass to a SWIG wrapped class - a slimmed down version of six.add_metaclass"""
    def wrapper(cls):
        return metaclass(cls.__name__, cls.__bases__, cls.__dict__.copy())
    return wrapper


class _SwigNonDynamicMeta(type):
    """Meta class to enforce nondynamic attributes (no new attributes) for a class"""
    __setattr__ = _swig_setattr_nondynamic_class_variable(type.__setattr__)


class tgstkAlgorithmBase(object):
    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")

    def __init__(self, *args, **kwargs):
        raise AttributeError("No constructor defined - class is abstract")
    __repr__ = _swig_repr
    __swig_destroy__ = _tgstk.delete_tgstkAlgorithmBase

    def check(self):
        return _tgstk.tgstkAlgorithmBase_check(self)

    def execute(self):
        return _tgstk.tgstkAlgorithmBase_execute(self)

    def update(self):
        return _tgstk.tgstkAlgorithmBase_update(self)

# Register tgstkAlgorithmBase in _tgstk:
_tgstk.tgstkAlgorithmBase_swigregister(tgstkAlgorithmBase)

class tgstkImageProcessorBase(tgstkAlgorithmBase):
    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")

    def __init__(self, *args, **kwargs):
        raise AttributeError("No constructor defined - class is abstract")
    __repr__ = _swig_repr
    __swig_destroy__ = _tgstk.delete_tgstkImageProcessorBase

# Register tgstkImageProcessorBase in _tgstk:
_tgstk.tgstkImageProcessorBase_swigregister(tgstkImageProcessorBase)

class tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter(tgstkImageProcessorBase):
    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")
    __repr__ = _swig_repr

    def __init__(self):
        _tgstk.tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter_swiginit(self, _tgstk.new_tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter())
    __swig_destroy__ = _tgstk.delete_tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter

    def check(self):
        return _tgstk.tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter_check(self)

    def execute(self):
        return _tgstk.tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter_execute(self)

    def getFinalCellDensityImage(self):
        return _tgstk.tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter_getFinalCellDensityImage(self)

    def getFinalCellDensityGradientImage(self):
        return _tgstk.tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter_getFinalCellDensityGradientImage(self)

    def setBrainMapImage(self, image):
        return _tgstk.tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter_setBrainMapImage(self, image)

    def setDiffusionTensorImage(self, image):
        return _tgstk.tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter_setDiffusionTensorImage(self, image)

    def setInitialCellDensityImage(self, image):
        return _tgstk.tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter_setInitialCellDensityImage(self, image)

    def setProliferationRateImage(self, image):
        return _tgstk.tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter_setProliferationRateImage(self, image)

    def setSimulatedTime(self, time):
        return _tgstk.tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter_setSimulatedTime(self, time)

    def setTimeStep(self, step):
        return _tgstk.tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter_setTimeStep(self, step)

# Register tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter in _tgstk:
_tgstk.tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter_swigregister(tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter)

class tgstkLinearQuadraticTumourCellSurvivalImageFilter(tgstkImageProcessorBase):
    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")
    __repr__ = _swig_repr

    def __init__(self):
        _tgstk.tgstkLinearQuadraticTumourCellSurvivalImageFilter_swiginit(self, _tgstk.new_tgstkLinearQuadraticTumourCellSurvivalImageFilter())
    __swig_destroy__ = _tgstk.delete_tgstkLinearQuadraticTumourCellSurvivalImageFilter

    def check(self):
        return _tgstk.tgstkLinearQuadraticTumourCellSurvivalImageFilter_check(self)

    def execute(self):
        return _tgstk.tgstkLinearQuadraticTumourCellSurvivalImageFilter_execute(self)

    def getFinalCellDensityImage(self):
        return _tgstk.tgstkLinearQuadraticTumourCellSurvivalImageFilter_getFinalCellDensityImage(self)

    def setAlpha(self, alpha):
        return _tgstk.tgstkLinearQuadraticTumourCellSurvivalImageFilter_setAlpha(self, alpha)

    def setBeta(self, beta):
        return _tgstk.tgstkLinearQuadraticTumourCellSurvivalImageFilter_setBeta(self, beta)

    def setDoseMapImage(self, image):
        return _tgstk.tgstkLinearQuadraticTumourCellSurvivalImageFilter_setDoseMapImage(self, image)

    def setInitialCellDensityImage(self, image):
        return _tgstk.tgstkLinearQuadraticTumourCellSurvivalImageFilter_setInitialCellDensityImage(self, image)

# Register tgstkLinearQuadraticTumourCellSurvivalImageFilter in _tgstk:
_tgstk.tgstkLinearQuadraticTumourCellSurvivalImageFilter_swigregister(tgstkLinearQuadraticTumourCellSurvivalImageFilter)

BACKGROUND = _tgstk.BACKGROUND
NECROTIC_CORE = _tgstk.NECROTIC_CORE
CSF = _tgstk.CSF
GREY_MATTER = _tgstk.GREY_MATTER
WHITE_MATTER = _tgstk.WHITE_MATTER
OEDEMA = _tgstk.OEDEMA
ENHANCING_CORE = _tgstk.ENHANCING_CORE


