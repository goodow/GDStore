#ifndef _GDRDisposable_H_
#define _GDRDisposable_H_

#import "JreEmulation.h"
#include "org/timepedia/exporter/client/Exportable.h"

typedef void (^GDREventBlock)(id event);
@class GDRDocumentSaveStateChangedEvent;
@class GDRCollaboratorJoinedEvent;
@class GDRCollaboratorLeftEvent;
typedef void (^GDRDocumentSaveStateChangedBlock)(GDRDocumentSaveStateChangedEvent * event);
typedef void (^GDRCollaboratorJoinedBlock)(GDRCollaboratorJoinedEvent * event);
typedef void (^GDRCollaboratorLeftBlock)(GDRCollaboratorLeftEvent * event);

@class GDRUndoRedoStateChangedEvent;
typedef void (^GDRUndoRedoStateChangedBlock)(GDRUndoRedoStateChangedEvent * event);

@class GDRObjectChangedEvent;
typedef void (^GDRObjectChangedBlock)(GDRObjectChangedEvent * event);

@class GDRValueChangedEvent;
typedef void (^GDRValueChangedBlock)(GDRValueChangedEvent * event);

@class GDRValuesAddedEvent;
@class GDRValuesRemovedEvent;
@class GDRValuesSetEvent;
typedef void (^GDRValuesAddedBlock)(GDRValuesAddedEvent * event);
typedef void (^GDRValuesRemovedBlock)(GDRValuesRemovedEvent * event);
typedef void (^GDRValuesSetBlock)(GDRValuesSetEvent * event);

@class GDRTextDeletedEvent;
@class GDRTextInsertedEvent;
typedef void (^GDRTextDeletedBlock)(GDRTextDeletedEvent * event);
typedef void (^GDRTextInsertedBlock)(GDRTextInsertedEvent * event);

@class GDRReferenceShiftedEvent;
typedef void (^GDRReferenceShiftedBlock)(GDRReferenceShiftedEvent * event);

@protocol GDRDisposable < OrgTimepediaExporterClientExportable, NSObject, JavaObject >
@end

#define ComGoodowRealtimeDisposable GDRDisposable

#endif // _GDRDisposable_H_
