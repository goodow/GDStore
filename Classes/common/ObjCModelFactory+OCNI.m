#import "ObjCModelFactory+OCNI.h"
#import "Google-Diff-Match-Patch/DiffMatchPatch.h"
#import "GDR.h"
#import "java/lang/RuntimeException.h"

@implementation ComGoodowRealtimeModelUtilImplObjCModelFactory (OCNI)
-(void)setTextImpl:(GDRCollaborativeString *)str text:(NSString *)text {
  DiffMatchPatch *dmp = [DiffMatchPatch new];
  NSMutableArray * diffs = [dmp diff_mainOfOldString:[str getText] andNewString:text];
  if(!diffs || [diffs count] == 0){
    return;
  }
  [dmp diff_cleanupSemantic:diffs];
  int cursor = 0;
  for(Diff *diff in diffs){
    text = diff.text;
    int len = text.length;
    switch (diff.operation) {
      case DIFF_EQUAL:
        cursor += len;
        break;
      case DIFF_INSERT:
        [str insertString:cursor text:text];
        cursor += len;
        break;
      case DIFF_DELETE:
        [str removeRange:cursor endIndex:cursor+len];
        break;
      default:
        @throw [[JavaLangRuntimeException alloc] initWithNSString:@"Shouldn't reach here!"];
    }
  }
}
@end
