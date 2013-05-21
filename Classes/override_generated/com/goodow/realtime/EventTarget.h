@class GDRObjectChangedEvent;
@class GDRTextDeletedEvent;
@class GDRTextInsertedEvent;
@class GDRValueChangedEvent;
@class GDRValuesAddedEvent;
@class GDRValuesRemovedEvent;
@class GDRValuesSetEvent;
@class GDRReferenceShiftedEvent;
@class GDRUndoRedoStateChangedEvent;
@class GDRCollaboratorJoinedEvent;
@class GDRCollaboratorLeftEvent;
@class GDRDocumentSaveStateChangedEvent;

typedef void (^GDREventBlock)(id event);
typedef void (^GDRObjectChangedBlock)(GDRObjectChangedEvent * event);
typedef void (^GDRTextDeletedBlock)(GDRTextDeletedEvent * event);
typedef void (^GDRTextInsertedBlock)(GDRTextInsertedEvent * event);
typedef void (^GDRValueChangedBlock)(GDRValueChangedEvent * event);
typedef void (^GDRValuesAddedBlock)(GDRValuesAddedEvent * event);
typedef void (^GDRValuesRemovedBlock)(GDRValuesRemovedEvent * event);
typedef void (^GDRValuesSetBlock)(GDRValuesSetEvent * event);
typedef void (^GDRReferenceShiftedBlock)(GDRReferenceShiftedEvent * event);
typedef void (^GDRUndoRedoStateChangedBlock)(GDRUndoRedoStateChangedEvent * event);
typedef void (^GDRCollaboratorJoinedBlock)(GDRCollaboratorJoinedEvent * event);
typedef void (^GDRCollaboratorLeftBlock)(GDRCollaboratorLeftEvent * event);
typedef void (^GDRDocumentSaveStateChangedBlock)(GDRDocumentSaveStateChangedEvent * event);

//typedef int (^GDRComparatorBlock)(id object1, id object2);


@class GDREventTypeEnum;
@protocol GDREventHandler;

#import "JreEmulation.h"
#import "com/goodow/realtime/Disposable.h"

@protocol GDREventTarget < GDRDisposable, NSObject >
- (void)addEventListenerWithGDREventTypeEnum:(GDREventTypeEnum *)type
                         withGDREventHandler:(id<GDREventHandler>)handler
                                    withBOOL:(BOOL)opt_capture;
- (void)removeEventListenerWithGDREventTypeEnum:(GDREventTypeEnum *)type
                            withGDREventHandler:(id<GDREventHandler>)handler
                                       withBOOL:(BOOL)opt_capture;
@end

#define ComGoodowRealtimeEventTarget GDREventTarget
