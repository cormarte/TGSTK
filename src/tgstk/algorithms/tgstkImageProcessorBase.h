#ifndef TGSTKIMAGEPROCESSORBASE_H
#define TGSTKIMAGEPROCESSORBASE_H

#define assertImageNumberOfScalarComponents(image, numberOfScalarComponents) _assertImageNumberOfScalarComponents(image, numberOfScalarComponents, #image)
#define assertImageScalarType(image, scalarTypes) _assertImageScalarType(image, scalarTypes, #image)

#include <tgstk/tgstkGlobal.h>
#include <tgstk/algorithms/tgstkAlgorithmBase.h>

#include <vector>
#include <vtkImageData.h>
#include <vtkSmartPointer.h>

class TGSTK_EXPORT tgstkImageProcessorBase : public virtual tgstkAlgorithmBase {

    public:

        virtual ~tgstkImageProcessorBase();

    protected:

        tgstkImageProcessorBase();

        bool _assertImageNumberOfScalarComponents(vtkSmartPointer<vtkImageData> image, std::vector<int> numberOfScalarComponents, std::string name);
        bool _assertImageScalarType(vtkSmartPointer<vtkImageData> image, std::vector<int> scalarTypes, std::string name);
        bool assertEqualImageDimensions(std::vector<vtkSmartPointer<vtkImageData>> images);
        bool assertEqualImageSpacings(std::vector<vtkSmartPointer<vtkImageData>> images);
        template<typename Type> static void fillImage(vtkSmartPointer<vtkImageData> image, Type value);
        static vtkSmartPointer<vtkImageData> getNewImageFromReferenceImage(vtkSmartPointer<vtkImageData> reference, int type, int numberOfComponents=1);
};

template<typename Type>
void tgstkImageProcessorBase::fillImage(vtkSmartPointer<vtkImageData> image, Type value) {

    int* dimensions = image->GetDimensions();
    int components = image->GetNumberOfScalarComponents();

    for (int z=0; z<dimensions[2]; z++) {

        for (int y=0; y<dimensions[1]; y++) {

            for (int x=0; x<dimensions[0]; x++) {

                for (int c=0; c<components; c++) {

                    static_cast<Type*>(image->GetScalarPointer(x, y, z))[c] = value;
                }
            }
        }
    }
}

#endif // TGSTKIMAGEPROCESSORBASE_H