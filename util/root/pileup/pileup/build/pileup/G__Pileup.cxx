// Do NOT change. Changes will be lost next time file is generated

#define R__DICTIONARY_FILENAME G__Pileup
#define R__NO_DEPRECATION

/*******************************************************************/
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#define G__DICTIONARY
#include "ROOT/RConfig.hxx"
#include "TClass.h"
#include "TDictAttributeMap.h"
#include "TInterpreter.h"
#include "TROOT.h"
#include "TBuffer.h"
#include "TMemberInspector.h"
#include "TInterpreter.h"
#include "TVirtualMutex.h"
#include "TError.h"

#ifndef G__ROOT
#define G__ROOT
#endif

#include "RtypesImp.h"
#include "TIsAProxy.h"
#include "TFileMergeInfo.h"
#include <algorithm>
#include "TCollectionProxyInfo.h"
/*******************************************************************/

#include "TDataMember.h"

// Header files passed as explicit arguments
#include "pileup/Pileup.h"

// Header files passed via #pragma extra_include

// The generated code does not explicitly qualify STL entities
namespace std {} using namespace std;

namespace Pileup {
   namespace ROOTDict {
      inline ::ROOT::TGenericClassInfo *GenerateInitInstance();
      static TClass *Pileup_Dictionary();

      // Function generating the singleton type initializer
      inline ::ROOT::TGenericClassInfo *GenerateInitInstance()
      {
         static ::ROOT::TGenericClassInfo 
            instance("Pileup", 0 /*version*/, "pileup/Pileup.h", 27,
                     ::ROOT::Internal::DefineBehavior((void*)nullptr,(void*)nullptr),
                     &Pileup_Dictionary, 0);
         return &instance;
      }
      // Insure that the inline function is _not_ optimized away by the compiler
      ::ROOT::TGenericClassInfo *(*_R__UNIQUE_DICT_(InitFunctionKeeper))() = &GenerateInitInstance;  
      // Static variable to force the class initialization
      static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstance(); R__UseDummy(_R__UNIQUE_DICT_(Init));

      // Dictionary for non-ClassDef classes
      static TClass *Pileup_Dictionary() {
         return GenerateInitInstance()->GetClass();
      }

   }
}

namespace ROOT {
   static TClass *PileupcLcLPileupMixer_Dictionary();
   static void PileupcLcLPileupMixer_TClassManip(TClass*);
   static void *new_PileupcLcLPileupMixer(void *p = nullptr);
   static void *newArray_PileupcLcLPileupMixer(Long_t size, void *p);
   static void delete_PileupcLcLPileupMixer(void *p);
   static void deleteArray_PileupcLcLPileupMixer(void *p);
   static void destruct_PileupcLcLPileupMixer(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::Pileup::PileupMixer*)
   {
      ::Pileup::PileupMixer *ptr = nullptr;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::Pileup::PileupMixer));
      static ::ROOT::TGenericClassInfo 
         instance("Pileup::PileupMixer", "pileup/Pileup.h", 46,
                  typeid(::Pileup::PileupMixer), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &PileupcLcLPileupMixer_Dictionary, isa_proxy, 4,
                  sizeof(::Pileup::PileupMixer) );
      instance.SetNew(&new_PileupcLcLPileupMixer);
      instance.SetNewArray(&newArray_PileupcLcLPileupMixer);
      instance.SetDelete(&delete_PileupcLcLPileupMixer);
      instance.SetDeleteArray(&deleteArray_PileupcLcLPileupMixer);
      instance.SetDestructor(&destruct_PileupcLcLPileupMixer);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::Pileup::PileupMixer*)
   {
      return GenerateInitInstanceLocal(static_cast<::Pileup::PileupMixer*>(nullptr));
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal(static_cast<const ::Pileup::PileupMixer*>(nullptr)); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *PileupcLcLPileupMixer_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal(static_cast<const ::Pileup::PileupMixer*>(nullptr))->GetClass();
      PileupcLcLPileupMixer_TClassManip(theClass);
   return theClass;
   }

   static void PileupcLcLPileupMixer_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_PileupcLcLPileupMixer(void *p) {
      return  p ? ::new(static_cast<::ROOT::Internal::TOperatorNewHelper*>(p)) ::Pileup::PileupMixer : new ::Pileup::PileupMixer;
   }
   static void *newArray_PileupcLcLPileupMixer(Long_t nElements, void *p) {
      return p ? ::new(static_cast<::ROOT::Internal::TOperatorNewHelper*>(p)) ::Pileup::PileupMixer[nElements] : new ::Pileup::PileupMixer[nElements];
   }
   // Wrapper around operator delete
   static void delete_PileupcLcLPileupMixer(void *p) {
      delete (static_cast<::Pileup::PileupMixer*>(p));
   }
   static void deleteArray_PileupcLcLPileupMixer(void *p) {
      delete [] (static_cast<::Pileup::PileupMixer*>(p));
   }
   static void destruct_PileupcLcLPileupMixer(void *p) {
      typedef ::Pileup::PileupMixer current_t;
      (static_cast<current_t*>(p))->~current_t();
   }
} // end of namespace ROOT for class ::Pileup::PileupMixer

namespace ROOT {
   static TClass *vectorlEunsignedsPlonggR_Dictionary();
   static void vectorlEunsignedsPlonggR_TClassManip(TClass*);
   static void *new_vectorlEunsignedsPlonggR(void *p = nullptr);
   static void *newArray_vectorlEunsignedsPlonggR(Long_t size, void *p);
   static void delete_vectorlEunsignedsPlonggR(void *p);
   static void deleteArray_vectorlEunsignedsPlonggR(void *p);
   static void destruct_vectorlEunsignedsPlonggR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const vector<unsigned long>*)
   {
      vector<unsigned long> *ptr = nullptr;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(vector<unsigned long>));
      static ::ROOT::TGenericClassInfo 
         instance("vector<unsigned long>", -2, "vector", 428,
                  typeid(vector<unsigned long>), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &vectorlEunsignedsPlonggR_Dictionary, isa_proxy, 0,
                  sizeof(vector<unsigned long>) );
      instance.SetNew(&new_vectorlEunsignedsPlonggR);
      instance.SetNewArray(&newArray_vectorlEunsignedsPlonggR);
      instance.SetDelete(&delete_vectorlEunsignedsPlonggR);
      instance.SetDeleteArray(&deleteArray_vectorlEunsignedsPlonggR);
      instance.SetDestructor(&destruct_vectorlEunsignedsPlonggR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::Pushback< vector<unsigned long> >()));

      instance.AdoptAlternate(::ROOT::AddClassAlternate("vector<unsigned long>","std::vector<unsigned long, std::allocator<unsigned long> >"));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal(static_cast<const vector<unsigned long>*>(nullptr)); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *vectorlEunsignedsPlonggR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal(static_cast<const vector<unsigned long>*>(nullptr))->GetClass();
      vectorlEunsignedsPlonggR_TClassManip(theClass);
   return theClass;
   }

   static void vectorlEunsignedsPlonggR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_vectorlEunsignedsPlonggR(void *p) {
      return  p ? ::new(static_cast<::ROOT::Internal::TOperatorNewHelper*>(p)) vector<unsigned long> : new vector<unsigned long>;
   }
   static void *newArray_vectorlEunsignedsPlonggR(Long_t nElements, void *p) {
      return p ? ::new(static_cast<::ROOT::Internal::TOperatorNewHelper*>(p)) vector<unsigned long>[nElements] : new vector<unsigned long>[nElements];
   }
   // Wrapper around operator delete
   static void delete_vectorlEunsignedsPlonggR(void *p) {
      delete (static_cast<vector<unsigned long>*>(p));
   }
   static void deleteArray_vectorlEunsignedsPlonggR(void *p) {
      delete [] (static_cast<vector<unsigned long>*>(p));
   }
   static void destruct_vectorlEunsignedsPlonggR(void *p) {
      typedef vector<unsigned long> current_t;
      (static_cast<current_t*>(p))->~current_t();
   }
} // end of namespace ROOT for class vector<unsigned long>

namespace ROOT {
   static TClass *vectorlEdoublegR_Dictionary();
   static void vectorlEdoublegR_TClassManip(TClass*);
   static void *new_vectorlEdoublegR(void *p = nullptr);
   static void *newArray_vectorlEdoublegR(Long_t size, void *p);
   static void delete_vectorlEdoublegR(void *p);
   static void deleteArray_vectorlEdoublegR(void *p);
   static void destruct_vectorlEdoublegR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const vector<double>*)
   {
      vector<double> *ptr = nullptr;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(vector<double>));
      static ::ROOT::TGenericClassInfo 
         instance("vector<double>", -2, "vector", 428,
                  typeid(vector<double>), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &vectorlEdoublegR_Dictionary, isa_proxy, 0,
                  sizeof(vector<double>) );
      instance.SetNew(&new_vectorlEdoublegR);
      instance.SetNewArray(&newArray_vectorlEdoublegR);
      instance.SetDelete(&delete_vectorlEdoublegR);
      instance.SetDeleteArray(&deleteArray_vectorlEdoublegR);
      instance.SetDestructor(&destruct_vectorlEdoublegR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::Pushback< vector<double> >()));

      instance.AdoptAlternate(::ROOT::AddClassAlternate("vector<double>","std::vector<double, std::allocator<double> >"));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal(static_cast<const vector<double>*>(nullptr)); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *vectorlEdoublegR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal(static_cast<const vector<double>*>(nullptr))->GetClass();
      vectorlEdoublegR_TClassManip(theClass);
   return theClass;
   }

   static void vectorlEdoublegR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_vectorlEdoublegR(void *p) {
      return  p ? ::new(static_cast<::ROOT::Internal::TOperatorNewHelper*>(p)) vector<double> : new vector<double>;
   }
   static void *newArray_vectorlEdoublegR(Long_t nElements, void *p) {
      return p ? ::new(static_cast<::ROOT::Internal::TOperatorNewHelper*>(p)) vector<double>[nElements] : new vector<double>[nElements];
   }
   // Wrapper around operator delete
   static void delete_vectorlEdoublegR(void *p) {
      delete (static_cast<vector<double>*>(p));
   }
   static void deleteArray_vectorlEdoublegR(void *p) {
      delete [] (static_cast<vector<double>*>(p));
   }
   static void destruct_vectorlEdoublegR(void *p) {
      typedef vector<double> current_t;
      (static_cast<current_t*>(p))->~current_t();
   }
} // end of namespace ROOT for class vector<double>

namespace ROOT {
   static TClass *vectorlEboolgR_Dictionary();
   static void vectorlEboolgR_TClassManip(TClass*);
   static void *new_vectorlEboolgR(void *p = nullptr);
   static void *newArray_vectorlEboolgR(Long_t size, void *p);
   static void delete_vectorlEboolgR(void *p);
   static void deleteArray_vectorlEboolgR(void *p);
   static void destruct_vectorlEboolgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const vector<bool>*)
   {
      vector<bool> *ptr = nullptr;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(vector<bool>));
      static ::ROOT::TGenericClassInfo 
         instance("vector<bool>", -2, "vector", 740,
                  typeid(vector<bool>), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &vectorlEboolgR_Dictionary, isa_proxy, 0,
                  sizeof(vector<bool>) );
      instance.SetNew(&new_vectorlEboolgR);
      instance.SetNewArray(&newArray_vectorlEboolgR);
      instance.SetDelete(&delete_vectorlEboolgR);
      instance.SetDeleteArray(&deleteArray_vectorlEboolgR);
      instance.SetDestructor(&destruct_vectorlEboolgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::Pushback< vector<bool> >()));

      instance.AdoptAlternate(::ROOT::AddClassAlternate("vector<bool>","std::vector<bool, std::allocator<bool> >"));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal(static_cast<const vector<bool>*>(nullptr)); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *vectorlEboolgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal(static_cast<const vector<bool>*>(nullptr))->GetClass();
      vectorlEboolgR_TClassManip(theClass);
   return theClass;
   }

   static void vectorlEboolgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_vectorlEboolgR(void *p) {
      return  p ? ::new(static_cast<::ROOT::Internal::TOperatorNewHelper*>(p)) vector<bool> : new vector<bool>;
   }
   static void *newArray_vectorlEboolgR(Long_t nElements, void *p) {
      return p ? ::new(static_cast<::ROOT::Internal::TOperatorNewHelper*>(p)) vector<bool>[nElements] : new vector<bool>[nElements];
   }
   // Wrapper around operator delete
   static void delete_vectorlEboolgR(void *p) {
      delete (static_cast<vector<bool>*>(p));
   }
   static void deleteArray_vectorlEboolgR(void *p) {
      delete [] (static_cast<vector<bool>*>(p));
   }
   static void destruct_vectorlEboolgR(void *p) {
      typedef vector<bool> current_t;
      (static_cast<current_t*>(p))->~current_t();
   }
} // end of namespace ROOT for class vector<bool>

namespace ROOT {
   static TClass *vectorlETStringgR_Dictionary();
   static void vectorlETStringgR_TClassManip(TClass*);
   static void *new_vectorlETStringgR(void *p = nullptr);
   static void *newArray_vectorlETStringgR(Long_t size, void *p);
   static void delete_vectorlETStringgR(void *p);
   static void deleteArray_vectorlETStringgR(void *p);
   static void destruct_vectorlETStringgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const vector<TString>*)
   {
      vector<TString> *ptr = nullptr;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(vector<TString>));
      static ::ROOT::TGenericClassInfo 
         instance("vector<TString>", -2, "vector", 428,
                  typeid(vector<TString>), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &vectorlETStringgR_Dictionary, isa_proxy, 0,
                  sizeof(vector<TString>) );
      instance.SetNew(&new_vectorlETStringgR);
      instance.SetNewArray(&newArray_vectorlETStringgR);
      instance.SetDelete(&delete_vectorlETStringgR);
      instance.SetDeleteArray(&deleteArray_vectorlETStringgR);
      instance.SetDestructor(&destruct_vectorlETStringgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::Pushback< vector<TString> >()));

      instance.AdoptAlternate(::ROOT::AddClassAlternate("vector<TString>","std::vector<TString, std::allocator<TString> >"));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal(static_cast<const vector<TString>*>(nullptr)); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *vectorlETStringgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal(static_cast<const vector<TString>*>(nullptr))->GetClass();
      vectorlETStringgR_TClassManip(theClass);
   return theClass;
   }

   static void vectorlETStringgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_vectorlETStringgR(void *p) {
      return  p ? ::new(static_cast<::ROOT::Internal::TOperatorNewHelper*>(p)) vector<TString> : new vector<TString>;
   }
   static void *newArray_vectorlETStringgR(Long_t nElements, void *p) {
      return p ? ::new(static_cast<::ROOT::Internal::TOperatorNewHelper*>(p)) vector<TString>[nElements] : new vector<TString>[nElements];
   }
   // Wrapper around operator delete
   static void delete_vectorlETStringgR(void *p) {
      delete (static_cast<vector<TString>*>(p));
   }
   static void deleteArray_vectorlETStringgR(void *p) {
      delete [] (static_cast<vector<TString>*>(p));
   }
   static void destruct_vectorlETStringgR(void *p) {
      typedef vector<TString> current_t;
      (static_cast<current_t*>(p))->~current_t();
   }
} // end of namespace ROOT for class vector<TString>

namespace ROOT {
   static TClass *maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR_Dictionary();
   static void maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR_TClassManip(TClass*);
   static void *new_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR(void *p = nullptr);
   static void *newArray_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR(Long_t size, void *p);
   static void delete_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR(void *p);
   static void deleteArray_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR(void *p);
   static void destruct_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const map<TString,pair<unsigned long,unsigned long> >*)
   {
      map<TString,pair<unsigned long,unsigned long> > *ptr = nullptr;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(map<TString,pair<unsigned long,unsigned long> >));
      static ::ROOT::TGenericClassInfo 
         instance("map<TString,pair<unsigned long,unsigned long> >", -2, "map", 102,
                  typeid(map<TString,pair<unsigned long,unsigned long> >), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR_Dictionary, isa_proxy, 0,
                  sizeof(map<TString,pair<unsigned long,unsigned long> >) );
      instance.SetNew(&new_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR);
      instance.SetNewArray(&newArray_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR);
      instance.SetDelete(&delete_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR);
      instance.SetDeleteArray(&deleteArray_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR);
      instance.SetDestructor(&destruct_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::MapInsert< map<TString,pair<unsigned long,unsigned long> > >()));

      instance.AdoptAlternate(::ROOT::AddClassAlternate("map<TString,pair<unsigned long,unsigned long> >","std::map<TString, std::pair<unsigned long, unsigned long>, std::less<TString>, std::allocator<std::pair<TString const, std::pair<unsigned long, unsigned long> > > >"));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal(static_cast<const map<TString,pair<unsigned long,unsigned long> >*>(nullptr)); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal(static_cast<const map<TString,pair<unsigned long,unsigned long> >*>(nullptr))->GetClass();
      maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR_TClassManip(theClass);
   return theClass;
   }

   static void maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR(void *p) {
      return  p ? ::new(static_cast<::ROOT::Internal::TOperatorNewHelper*>(p)) map<TString,pair<unsigned long,unsigned long> > : new map<TString,pair<unsigned long,unsigned long> >;
   }
   static void *newArray_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR(Long_t nElements, void *p) {
      return p ? ::new(static_cast<::ROOT::Internal::TOperatorNewHelper*>(p)) map<TString,pair<unsigned long,unsigned long> >[nElements] : new map<TString,pair<unsigned long,unsigned long> >[nElements];
   }
   // Wrapper around operator delete
   static void delete_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR(void *p) {
      delete (static_cast<map<TString,pair<unsigned long,unsigned long> >*>(p));
   }
   static void deleteArray_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR(void *p) {
      delete [] (static_cast<map<TString,pair<unsigned long,unsigned long> >*>(p));
   }
   static void destruct_maplETStringcOpairlEunsignedsPlongcOunsignedsPlonggRsPgR(void *p) {
      typedef map<TString,pair<unsigned long,unsigned long> > current_t;
      (static_cast<current_t*>(p))->~current_t();
   }
} // end of namespace ROOT for class map<TString,pair<unsigned long,unsigned long> >

namespace ROOT {
   // Registration Schema evolution read functions
   int RecordReadRules_libPileup() {
      return 0;
   }
   static int _R__UNIQUE_DICT_(ReadRules_libPileup) = RecordReadRules_libPileup();R__UseDummy(_R__UNIQUE_DICT_(ReadRules_libPileup));
} // namespace ROOT
namespace {
  void TriggerDictionaryInitialization_libPileup_Impl() {
    static const char* headers[] = {
"pileup/Pileup.h",
nullptr
    };
    static const char* includePaths[] = {
"/home/ixiotidi/Development/HEPData4ML/util/root/pileup/pileup/inc",
"/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/include",
"/home/ixiotidi/Development/HEPData4ML/util/root/pileup/pileup",
"/cvmfs/sft.cern.ch/lcg/views/LCG_108/x86_64-el9-clang19-opt/include",
"/home/ixiotidi/Development/HEPData4ML/util/root/pileup/pileup/inc",
"/home/ixiotidi/Development/HEPData4ML/external/hepmc/hepmc3-install/include",
"/home/ixiotidi/Development/HEPData4ML/util/root/pileup/pileup",
"/cvmfs/sft.cern.ch/lcg/views/LCG_108/x86_64-el9-clang19-opt/include",
"/cvmfs/sft.cern.ch/lcg/releases/ROOT/6.36.02-c35af/x86_64-el9-clang19-opt/include/",
"/home/ixiotidi/Development/HEPData4ML/util/root/pileup/pileup/build/pileup/",
nullptr
    };
    static const char* fwdDeclCode = nullptr;
    static const char* payloadCode = nullptr;
    static const char* classesHeaders[] = {
nullptr
};
    static bool isInitialized = false;
    if (!isInitialized) {
      TROOT::RegisterModule("libPileup",
        headers, includePaths, payloadCode, fwdDeclCode,
        TriggerDictionaryInitialization_libPileup_Impl, {}, classesHeaders, /*hasCxxModule*/false);
      isInitialized = true;
    }
  }
  static struct DictInit {
    DictInit() {
      TriggerDictionaryInitialization_libPileup_Impl();
    }
  } __TheDictionaryInitializer;
}
void TriggerDictionaryInitialization_libPileup() {
  TriggerDictionaryInitialization_libPileup_Impl();
}
