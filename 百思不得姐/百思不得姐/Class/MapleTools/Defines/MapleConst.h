#import <UIKit/UIKit.h>

UIKIT_EXTERN CGFloat const MPTitleViewH;
UIKIT_EXTERN CGFloat const MPNavH;
/**
 *  nav bottom
 */
UIKIT_EXTERN CGFloat const MPNavB;
UIKIT_EXTERN CGFloat const MPTabH;

UIKIT_EXTERN NSString* const MPFmt;
//空白
UIKIT_EXTERN CGFloat const MPMargin;


/**
 *  1为全部，10为图片，29为段子，31为音频，41为视频，默认为1
 */
typedef enum{
    EssenceTypeAll = 1,
    EssenceTypeViode = 41,
    EssenceTypeSound = 31,
    EssenceTypePicture = 10,
    EssenceTypeWord = 29
}EssenceType;

UIKIT_EXTERN CGFloat const MPPictureMAXH ;
UIKIT_EXTERN CGFloat const MPPictureREH ;