#-------------------------------------------------
#
# Project created by QtCreator 2020-02-13T09:15:24
#
#-------------------------------------------------

QT -= core gui

TARGET = tgstk
TEMPLATE = lib

DEFINES += TGSTK_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    tgstk/algorithms/tgstkAlgorithmBase.cpp \
    tgstk/algorithms/tgstkImageToMeshFilter.cpp \
    tgstk/core/tgstkObjectBase.cpp \
    tgstk/algorithms/tgstkMeshScalarsFromImageFilter.cpp \
    tgstk/algorithms/tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter.cpp \
    tgstk/algorithms/tgstkImageProcessor.cpp \
    tgstk/algorithms/tgstkWaterToTumourCellDiffusionTensorImageFilter.cpp \
    tgstk/algorithms/tgstkMeshProcessor.cpp \
    tgstk/algorithms/tgstkLinearQuadraticTumourCellSurvivalImageFilter.cpp

HEADERS += \
    tgstk/algorithms/tgstkAlgorithmBase.h \
    tgstk/algorithms/tgstkImageToMeshFilter.h \
    tgstk/core/tgstkObjectBase.h \
    tgstk/core/tgstkDefines.h \
    tgstk/algorithms/tgstkMeshScalarsFromImageFilter.h \
    tgstk/external/featk/featkNode.h \
    tgstk/external/featk/featkUtils.h \
    tgstk/algorithms/tgstkFiniteDifferenceReactionDiffusionTumourGrowthFilter.h \
    tgstk/algorithms/tgstkImageProcessor.h \
    tgstk/misc/tgstkBrainTissueType.h \
    tgstk/algorithms/tgstkWaterToTumourCellDiffusionTensorImageFilter.h \
    tgstk/misc/tgstkDefines.h \
    tgstk/cuda/tgstkCUDAOperations.h \
    tgstk/cuda/tgstkCUDADerivatives.h \
    tgstk/tgstkGlobal.h \
    tgstk/cuda/tgstkFiniteDifferenceReactionDiffusionStandardStencil.h \
    tgstk/algorithms/tgstkMeshProcessor.h \
    tgstk/cuda/tgstkCUDACommon.h \
    tgstk/algorithms/tgstkLinearQuadraticTumourCellSurvivalImageFilter.h \
    tgstk/cuda/tgstkLinearQuadraticTumourCellSurvival.h

#Boost
BOOST_MAJOR = 1
BOOST_MINOR = 65
BOOST_VERSION = $${BOOST_MAJOR}.$${BOOST_MINOR}

INCLUDEPATH += \
    C:/Libraries/Boost/$$BOOST_VERSION/install/include

LIBS += \
    -LC:/Libraries/Boost/$$BOOST_VERSION/install/lib64-msvc-14.0

#Eigen
EIGEN_MAJOR = 3
EIGEN_MINOR = 3
EIGEN_BUILD = 4
EIGEN_VERSION = $${EIGEN_MAJOR}.$${EIGEN_MINOR}
EIGEN_FULL_VERSION = $${EIGEN_VERSION}.$${EIGEN_BUILD}

INCLUDEPATH += \
    C:/Libraries/Eigen/$$EIGEN_FULL_VERSION/install/include/eigen3 \

#CGAL
CGAL_MAJOR = 4
CGAL_MINOR = 12
CGAL_VERSION = $${CGAL_MAJOR}.$${CGAL_MINOR}

INCLUDEPATH += \
    C:/Libraries/CGAL/$$CGAL_VERSION/install/include/

LIBS += \
    -LC:/Libraries/CGAL/$$CGAL_VERSION/install/lib \
    -lCGAL_Core-vc140-mt-$$CGAL_VERSION-I-900 \
    -lCGAL_ImageIO-vc140-mt-$$CGAL_VERSION-I-900 \
    -lCGAL-vc140-mt-$$CGAL_VERSION-I-900

#CUDA
CUDA_MAJOR = 9
CUDA_MINOR = 2
CUDA_VERSION = $${CUDA_MAJOR}.$${CUDA_MINOR}

CUDA_DIR = "C:/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v$$CUDA_VERSION"

CUDA_SOURCES += ./tgstk/cuda/tgstkCUDADerivatives.cu \
                ./tgstk/cuda/tgstkCUDAOperations.cu \
                ./tgstk/cuda/tgstkFiniteDifferenceReactionDiffusionStandardStencil.cu

SYSTEM_NAME = x64
SYSTEM_TYPE = 64
CUDA_ARCH = sm_61
NVCC_OPTIONS = --use_fast_math

INCLUDEPATH += $$CUDA_DIR/include
QMAKE_LIBDIR += $$CUDA_DIR/lib/$$SYSTEM_NAME

CUDA_LIBS = -lcuda -lcudart
CUDA_INC += $$join(INCLUDEPATH,'" -I"','-I"','"')

LIBS += $$CUDA_LIBS

MSVCRT_LINK_FLAG_DEBUG = "/MDd"
MSVCRT_LINK_FLAG_RELEASE = "/MD"

CUDA_OBJECTS_DIR = "./release"

CONFIG(debug, debug|release) {

    cuda_d.input    = CUDA_SOURCES
    cuda_d.output   = $$CUDA_OBJECTS_DIR/${QMAKE_FILE_BASE}_cuda.obj
    cuda_d.commands = $$CUDA_DIR/bin/nvcc.exe -D_DEBUG $$NVCC_OPTIONS --cl-version 2015 $$CUDA_INC $$CUDA_LIBS \
                      --machine $$SYSTEM_TYPE -arch=$$CUDA_ARCH \
                      --compile -cudart static -g -DWIN32 -D_MBCS \
                      -Xcompiler "/wd4819,/EHsc,/W3,/nologo,/Od,/Zi,/RTC1" \
                      -Xcompiler $$MSVCRT_LINK_FLAG_DEBUG \
                      -c -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_NAME}
    cuda_d.dependency_type = TYPE_C
    QMAKE_EXTRA_COMPILERS += cuda_d
}

else {

     cuda.input    = CUDA_SOURCES
     cuda.output   = $$CUDA_OBJECTS_DIR/${QMAKE_FILE_BASE}_cuda.obj
     cuda.commands = $$CUDA_DIR/bin/nvcc.exe $$NVCC_OPTIONS --cl-version 2015 $$CUDA_INC $$CUDA_LIBS \
                    --machine $$SYSTEM_TYPE -arch=$$CUDA_ARCH \
                    --compile -cudart static -DWIN32 -D_MBCS \
                    -Xcompiler "/wd4819,/EHsc,/W3,/nologo,/O2,/Zi" \
                    -Xcompiler $$MSVCRT_LINK_FLAG_RELEASE \
                    -c -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_NAME}
     cuda.dependency_type = TYPE_C
     QMAKE_EXTRA_COMPILERS += cuda
}

#GMP
GMP_MAJOR = 10
GMP_VERSION = $${GMP_MAJOR}

INCLUDEPATH += \
    C:/Libraries/GMP/$$GMP_VERSION/install/include

LIBS += \
    -LC:/Libraries/GMP/$$GMP_VERSION/install/lib \
    -llibgmp-$$GMP_VERSION \

#MPFR
MPFR_MAJOR = 4
MPFR_VERSION = $${MPFR_MAJOR}

INCLUDEPATH += \
    C:/Libraries/MPFR/$$MPFR_VERSION/install/include

LIBS +=  \
    -LC:/Libraries/MPFR/$$MPFR_VERSION/install/lib \
    -llibmpfr-$$MPFR_VERSION

#VTK
VTK_MAJOR = 8
VTK_MINOR = 0
VTK_BUILD = 1

VTK_VERSION = $${VTK_MAJOR}.$${VTK_MINOR}
VTK_FULL_VERSION = $${VTK_VERSION}.$${VTK_BUILD}

INCLUDEPATH += \
    C:/Libraries/VTK/$$VTK_FULL_VERSION/install/include/vtk-$$VTK_VERSION

LIBS += \
    -LC:/Libraries/VTK/$$VTK_FULL_VERSION/install/lib \
    -lvtkCommonColor-$$VTK_VERSION \
    -lvtkCommonComputationalGeometry-$$VTK_VERSION \
    -lvtkCommonCore-$$VTK_VERSION \
    -lvtkCommonDataModel-$$VTK_VERSION \
    -lvtkCommonExecutionModel-$$VTK_VERSION \
    -lvtkCommonMath-$$VTK_VERSION \
    -lvtkCommonMisc-$$VTK_VERSION \
    -lvtkCommonSystem-$$VTK_VERSION \
    -lvtkDICOM-$$VTK_VERSION \
    -lvtkDICOMParser-$$VTK_VERSION \
    -lvtkCommonTransforms-$$VTK_VERSION \
    -lvtkFiltersCore-$$VTK_VERSION \
    -lvtkFiltersExtraction-$$VTK_VERSION \
    -lvtkFiltersGeneral-$$VTK_VERSION \
    -lvtkFiltersGeometry-$$VTK_VERSION \
    -lvtkFiltersSources-$$VTK_VERSION \
    -lvtkFiltersStatistics-$$VTK_VERSION \
    -lvtkglew-$$VTK_VERSION \
    -lvtkGUISupportQt-$$VTK_VERSION \
    -lvtkImagingCore-$$VTK_VERSION \
    -lvtkImagingFourier-$$VTK_VERSION \
    -lvtkInteractionStyle-$$VTK_VERSION \
    -lvtkIOCore-$$VTK_VERSION \
    -lvtkIOGeometry-$$VTK_VERSION \
    -lvtkIOImage-$$VTK_VERSION \
    -lvtkIOLegacy-$$VTK_VERSION \
    -lvtkjpeg-$$VTK_VERSION \
    -lvtkmetaio-$$VTK_VERSION \
    -lvtkpng-$$VTK_VERSION \
    -lvtkRenderingCore-$$VTK_VERSION \
    -lvtkRenderingOpenGL2-$$VTK_VERSION \
    -lvtkRenderingQt-$$VTK_VERSION \
    -lvtksys-$$VTK_VERSION \
    -lvtktiff-$$VTK_VERSION \
    -lvtkzlib-$$VTK_VERSION

unix {
    target.path = /usr/lib
    INSTALLS += target
}

DISTFILES += \
    tgstk/cuda/tgstkFiniteDifferenceReactionDiffusionStandardStencil.cu \
    tgstk/cuda/tgstkCUDAOperations.cu \
    tgstk/cuda/tgstkCUDAOperations.cu \
    tgstk/cuda/tgstkCUDADerivatives.cu \
    tgstk/cuda/tgstkLinearQuadraticTumourCellSurvival.cu
