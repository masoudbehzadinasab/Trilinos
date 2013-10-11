// @HEADER
// ***********************************************************************
//
//          Tpetra: Templated Linear Algebra Services Package
//                 Copyright (2008) Sandia Corporation
//
// Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
// the U.S. Government retains certain rights in this software.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
// 1. Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
// notice, this list of conditions and the following disclaimer in the
// documentation and/or other materials provided with the distribution.
//
// 3. Neither the name of the Corporation nor the names of the
// contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY SANDIA CORPORATION "AS IS" AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL SANDIA CORPORATION OR THE
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
// NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Questions? Contact Michael A. Heroux (maherou@sandia.gov)
//
// ************************************************************************
// @HEADER

#ifndef TPETRA_KOKKOS_REFACTOR_VECTOR_DECL_HPP
#define TPETRA_KOKKOS_REFACTOR_VECTOR_DECL_HPP

#include "Tpetra_ConfigDefs.hpp"
#include "Tpetra_KokkosRefactor_MultiVector_decl.hpp"
#include "Tpetra_Vector_decl.hpp"
#include <KokkosCompat_ClassicNodeAPI_Wrapper.hpp>

namespace Tpetra {

/// \class Vector
/// \brief A distributed dense vector.
///
/// This class inherits from MultiVector, and has the same template
/// parameters.  A Vector is a special case of a MultiVector that has
/// only one vector (column).  It may be used wherever a MultiVector
/// may be used.
template<class Scalar,
         class LocalOrdinal,
         class GlobalOrdinal>
class Vector<Scalar,LocalOrdinal,GlobalOrdinal,Kokkos::Compat::KokkosThreadsWrapperNode> :
   public MultiVector<Scalar,LocalOrdinal,GlobalOrdinal,Kokkos::Compat::KokkosThreadsWrapperNode> {
  // need this so that MultiVector::operator() can call Vector's private view constructor
  typedef Kokkos::Compat::KokkosThreadsWrapperNode Node;
  friend class MultiVector<Scalar,LocalOrdinal,GlobalOrdinal,Node>;

  
public:
  //! @name Constructor/Destructor Methods
  //@{

  //! Sets all vector entries to zero.
  explicit Vector(const RCP<const Map<LocalOrdinal,GlobalOrdinal,Node> > &map, bool zeroOut=true);

  //! Vector copy constructor.
  Vector(const Vector<Scalar,LocalOrdinal,GlobalOrdinal,Node> &source);

  //! \brief Set vector values from an existing array (copy)
  Vector(const RCP<const Map<LocalOrdinal,GlobalOrdinal,Node> > &map, const ArrayView<const Scalar> &A);

  //! Destructor.
  virtual ~Vector();

  //@}
  //! @name Post-construction modification routines
  //@{

  //!Create a cloned Vector for a different node type
  template <class Node2>
  RCP<Vector<Scalar, LocalOrdinal, GlobalOrdinal, Node2> >
  clone(const RCP<Node2> &node2);


  //! Replace current value at the specified location with specified value.
  /** \pre \c globalRow must be a valid global element on this node, according to the row map.
   */
  void replaceGlobalValue(GlobalOrdinal globalRow, const Scalar &value);

  //! Adds specified value to existing value at the specified location.
  /** \pre \c globalRow must be a valid global element on this node, according to the row map.
   */
  void sumIntoGlobalValue(GlobalOrdinal globalRow, const Scalar &value);

  //! Replace current value at the specified location with specified values.
  /** \pre \c localRow must be a valid local element on this node, according to the row map.
   */
  void replaceLocalValue(LocalOrdinal myRow, const Scalar &value);

  //! Adds specified value to existing value at the specified location.
  /** \pre \c localRow must be a valid local element on this node, according to the row map.
   */
  void sumIntoLocalValue(LocalOrdinal myRow, const Scalar &value);

  //@}

  //! @name Extraction methods
  //@{

  using MultiVector<Scalar,LocalOrdinal,GlobalOrdinal,Node>::get1dCopy; // overloading, not hiding
  //! Return multi-vector values in user-provided two-dimensional array (using Teuchos memory management classes).
  void get1dCopy(ArrayView<Scalar> A) const;

  using MultiVector<Scalar,LocalOrdinal,GlobalOrdinal,Node>::getDataNonConst; // overloading, not hiding
  //! View of the local values of this vector.
  Teuchos::ArrayRCP<Scalar> getDataNonConst()     { return getDataNonConst(0); }

  using MultiVector<Scalar,LocalOrdinal,GlobalOrdinal,Node>::getData; // overloading, not hiding
  //! Const view of the local values of this vector.
  Teuchos::ArrayRCP<const Scalar> getData() const { return getData(0); }

  //@}

  //! @name Mathematical methods
  //@{

  using MultiVector<Scalar,LocalOrdinal,GlobalOrdinal,Node>::dot; // overloading, not hiding
  //! Computes dot product of this Vector against input Vector x.
  Scalar dot(const Vector<Scalar,LocalOrdinal,GlobalOrdinal,Node> &a) const;

  using MultiVector<Scalar,LocalOrdinal,GlobalOrdinal,Node>::norm1; // overloading, not hiding
  //! Return 1-norm of this Vector.
  typename Teuchos::ScalarTraits<Scalar>::magnitudeType norm1() const;

  using MultiVector<Scalar,LocalOrdinal,GlobalOrdinal,Node>::norm2; // overloading, not hiding
  //! Compute 2-norm of this Vector.
  typename Teuchos::ScalarTraits<Scalar>::magnitudeType norm2() const;

  using MultiVector<Scalar,LocalOrdinal,GlobalOrdinal,Node>::normInf; // overloading, not hiding
  //! Compute Inf-norm of this Vector.
  typename Teuchos::ScalarTraits<Scalar>::magnitudeType normInf() const;

  using MultiVector<Scalar,LocalOrdinal,GlobalOrdinal,Node>::normWeighted; // overloading, not hiding
  //! Compute Weighted 2-norm (RMS Norm) of this Vector.
  typename Teuchos::ScalarTraits<Scalar>::magnitudeType normWeighted(const Vector<Scalar,LocalOrdinal,GlobalOrdinal,Node> &weights) const;

  using MultiVector<Scalar,LocalOrdinal,GlobalOrdinal,Node>::meanValue; // overloading, not hiding
  //! Compute mean (average) value of this Vector.
  Scalar meanValue() const;

  //@}
  //! @name Implementation of the Teuchos::Describable interface
  //@{

  //! A simple one-line description of this object.
  virtual std::string description() const;

  //! Print the object with some verbosity level to a FancyOStream.
  virtual void
  describe (Teuchos::FancyOStream& out,
            const Teuchos::EVerbosityLevel verbLevel =
            Teuchos::Describable::verbLevel_default) const;
  //@}

protected:

  template <class S,class LO,class GO,class N>
  friend RCP< Vector<S,LO,GO,N> >
  createVectorFromView(const RCP<const Map<LO,GO,N> > &,const ArrayRCP<S> &);

  // view constructor, sitting on user allocated data, only for CPU nodes
  // and his non-member constructor friend
  Vector (const RCP<const Map<LocalOrdinal,GlobalOrdinal,Node> > &map,
          const ArrayRCP<Scalar> &view,
          EPrivateHostViewConstructor /* dummy tag */);

  //! Advanced constructor accepting parallel buffer view, used by MultiVector to break off Vector objects
  Vector (const RCP<const Map<LocalOrdinal,GlobalOrdinal,Node> > &map,
          const ArrayRCP<Scalar> & data);

  //! Advanced constructor accepting parallel buffer view, used by MultiVector to break off Vector objects
  Vector (const RCP<const Map<LocalOrdinal,GlobalOrdinal,Node> > &map,
          const ArrayRCP<Scalar> & data,
          EPrivateComputeViewConstructor /* dummy tag */);

  typedef KokkosClassic::MultiVector<Scalar,Node> KMV;
  typedef KokkosClassic::DefaultArithmetic<KMV>   MVT;
}; // class Vector

/** \brief Non-member function to create a Vector from a specified Map.
    \relatesalso Vector
*/
/*template <class Scalar, class LocalOrdinal, class GlobalOrdinal, class Node>
RCP<Vector<Scalar,LocalOrdinal,GlobalOrdinal,Node> >
createVector (const RCP< const Map<LocalOrdinal,GlobalOrdinal,Node> > &map)
{
  const bool DO_INIT_TO_ZERO = true;
  return rcp (new Vector<Scalar,LocalOrdinal,GlobalOrdinal,Node> (map, DO_INIT_TO_ZERO));
}*/

//! \brief Non-member function to create a Vector with view semantics using user-allocated data.
/*! This use case is not supported for all nodes. Specifically, it is not typically supported for accelerator-based nodes like KokkosClassic::ThrustGPUNode.
    \relatesalso Vector
 */
/*template <class Scalar, class LocalOrdinal, class GlobalOrdinal, class Node>
RCP<Vector<Scalar,LocalOrdinal,GlobalOrdinal,Node> >
createVectorFromView (const RCP<const Map<LocalOrdinal,GlobalOrdinal,Node> > &map,
                      const ArrayRCP<Scalar> &view)
{
  return rcp(
    // this is a protected constructor, but we are friends
    new Vector<Scalar,LocalOrdinal,GlobalOrdinal,Node>(
      map,
      // this will fail to compile for unsupported node types
      Tpetra::details::ViewAccepter<Node>::template acceptView<Scalar>(view),
      HOST_VIEW_CONSTRUCTOR)
  );
}*/

/*template <class Scalar, class LocalOrdinal, class GlobalOrdinal, class Node>
template <class Node2>
RCP<Vector<Scalar, LocalOrdinal, GlobalOrdinal, Node2> >
Vector<Scalar, LocalOrdinal, GlobalOrdinal, Node>::clone(const RCP<Node2> &node2){
        typedef Map<LocalOrdinal,GlobalOrdinal,Node2> Map2;
        typedef Vector<Scalar,LocalOrdinal,GlobalOrdinal,Node2> V2;
        Teuchos::ArrayRCP<const Scalar> V_view = this->getData();
        Teuchos::RCP<const Map2> clonedMap = this->getMap()->template clone<Node2> (node2);
        Teuchos::RCP<V2> clonedV = Teuchos::rcp(new V2(clonedMap));
        Teuchos::ArrayRCP<Scalar> clonedV_view = clonedV->getDataNonConst();
        clonedV_view.deepCopy(V_view());
        clonedV_view = Teuchos::null;
        return clonedV;
  }*/

} // namespace Tpetra

#endif // TPETRA_KOKKOS_REFACTOR_VECTOR_DECL_HPP