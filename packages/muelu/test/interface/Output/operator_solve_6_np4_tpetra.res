verbosity = high
coarse: max size = 100
transpose: use implicit = 0
max levels = 4
number of equations = 1   [default]
level 1 -> 
 P = Teuchos::RCP<Xpetra::Matrix<ignored> >{ptr=,node=,strong_count=6,weak_count=0}
 Nullspace = Teuchos::RCP<Xpetra::MultiVector<double, int, int, Kokkos::Compat::KokkosDeviceWrapperNode<Kokkos::Serial> > >{ptr=,node=,strong_count=6,weak_count=0}

Clearing old data (if any)
MueLu::Amesos2Smoother: using "Superlu"
MueLu::AmesosSmoother: using "Superlu"
Using default factory (MueLu::SmootherFactory{pre = MueLu::DirectSolver{type = }, post = null}) for building 'CoarseSolver'.
Using default factory (MueLu::SmootherFactory{pre = MueLu::TrilinosSmoother{type = RELAXATION}, post = pre}) for building 'Smoother'.
Level 0
 Setup Smoother (MueLu::Ifpack2Smoother{type = RELAXATION})
  "Ifpack2::Relaxation": {Initialized: true, Computed: true, Type: Symmetric Gauss-Seidel, sweeps: 1, damping factor: 1, Global matrix dimensions: [10000, 10000], Global nnz: 49600}
MueLu::Amesos2Smoother: using "Superlu"
MueLu::AmesosSmoother: using "Superlu"
Using default factory (MueLu::SmootherFactory{pre = MueLu::DirectSolver{type = }, post = null}) for building 'CoarseSolver'.
Using default factory (MueLu::SmootherFactory{pre = MueLu::TrilinosSmoother{type = RELAXATION}, post = pre}) for building 'Smoother'.
Using default factory (MueLu::AmalgamationFactory) for building 'UnAmalgamationInfo'.
Level 1
 Transpose P (MueLu::TransPFactory)
  R size =  1700 x 10000, nnz = 24864
  R Load balancing info
  R   # active processes: 4/4
  R   # rows per proc   : avg = 4.25e+02,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  R   #  nnz per proc   : avg = 6.22e+03,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  R Communication info
  R   # num export send : avg =     0.00,  dev =   0.00,  min =    0.0 ,  max =    0.0
  R   # num import send : avg = 1.00e+02,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  R   # num msgs        : avg =     2.00,  dev =   0.00,  min =    2.0 ,  max =    2.0
  R   # min msg size    : avg = 5.00e+01,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  R   # max msg size    : avg = 5.00e+01,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
 Computing Ac (MueLu::RAPFactory)
  MxM: A x P
   Matrix product nnz per row estimate = 5
  MxM: R x (AP) (explicit)
   Matrix product nnz per row estimate = 18
  Ac size =  1700 x 1700, nnz = 15318
  Ac Load balancing info
  Ac   # active processes: 4/4
  Ac   # rows per proc   : avg = 4.25e+02,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  Ac   #  nnz per proc   : avg = 3.83e+03,  dev =   0.0%,  min =   -0.0%,  max =   +0.0%
  Ac Communication info
  Ac   # num export send : avg =     0.00,  dev =   0.00,  min =    0.0 ,  max =    0.0
  Ac   # num import send : avg = 7.28e+01,  dev =   0.7%,  min =   -1.0%,  max =   +0.3%
  Ac   # num msgs        : avg =     3.00,  dev =   0.00,  min =    3.0 ,  max =    3.0
  Ac   # min msg size    : avg = 1.25e+00,  dev =  40.0%,  min =  -20.0%,  max =  +60.0%
  Ac   # max msg size    : avg = 3.75e+01,  dev =   1.5%,  min =   -1.3%,  max =   +1.3%
 Setup Smoother (MueLu::Ifpack2Smoother{type = RELAXATION})
  "Ifpack2::Relaxation": {Initialized: true, Computed: true, Type: Symmetric Gauss-Seidel, sweeps: 1, damping factor: 1, Global matrix dimensions: [1700, 1700], Global nnz: 15318}
MueLu::Amesos2Smoother: using "Superlu"
MueLu::AmesosSmoother: using "Superlu"
Using default factory (MueLu::SmootherFactory{pre = MueLu::DirectSolver{type = }, post = null}) for building 'CoarseSolver'.
Using default factory (MueLu::SmootherFactory{pre = MueLu::TrilinosSmoother{type = RELAXATION}, post = pre}) for building 'Smoother'.
Using default factory (MueLu::AmalgamationFactory) for building 'UnAmalgamationInfo'.
Level 2
 Prolongator smoothing (MueLu::SaPFactory)
  Matrix filtering (MueLu::FilteredAFactory)
   Build (MueLu::CoalesceDropFactory)
    lightweight wrap = 1
    algorithm = "classical": threshold = 0.00, blocksize = 1
    Detected 0 Dirichlet nodes
    Number of dropped entries in unamalgamated matrix graph: 0/15318 (0.00%)
   Filtered matrix is not being constructed as no filtering is being done
  Build (MueLu::TentativePFactory)
   Build (MueLu::UncoupledAggregationFactory)
    Algo "Phase - (Dirichlet)"
     BuildAggregates (Phase - (Dirichlet))
       aggregated : 0 (phase), 0/1700 [0.00%] (total)
       remaining  : 1700
       aggregates : 0 (phase), 0 (total)
    Algo "Phase 1 (main)"
     BuildAggregates (Phase 1 (main))
       aggregated : 1700 (phase), 1700/1700 [100.00%] (total)
       remaining  : 0
       aggregates : 216 (phase), 216 (total)
    Algo "Phase 2 (cleanup)"
     BuildAggregates (Phase 2 (cleanup))
       aggregated : 0 (phase), 1700/1700 [100.00%] (total)
       remaining  : 0
       aggregates : 0 (phase), 216 (total)
    Algo "Phase 3 (emergency)"
     BuildAggregates (Phase 3 (emergency))
       aggregated : 0 (phase), 1700/1700 [100.00%] (total)
       remaining  : 0
       aggregates : 0 (phase), 216 (total)
    Algo "Phase - (isolated)"
     BuildAggregates (Phase - (isolated))
       aggregated : 0 (phase), 1700/1700 [100.00%] (total)
       remaining  : 0
       aggregates : 0 (phase), 216 (total)
    "UC": MueLu::Aggregates{nGlobalAggregates = 216}
   Build (MueLu::AmalgamationFactory)
    AmalagamationFactory::Build(): found fullblocksize=1 and stridedblocksize=1 from strided maps. offset=0
   Build (MueLu::CoarseMapFactory)
    domainGIDOffset: 0 block size: 1 stridedBlockId: -1
   Column map is consistent with the row map, good.
   TentativePFactory : aggregates do not cross process boundaries
   Ptent size =  1700 x 216, nnz = 1700
   Ptent Load balancing info
   Ptent   # active processes: 4/4
   Ptent   # rows per proc   : avg = 4.25e+02,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
   Ptent   #  nnz per proc   : avg = 4.25e+02,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  Eigenvalue estimate
   Calculating max eigenvalue estimate now (max iters = 10)
   Prolongator damping factor = 0.99 (1.33 / 1.35)
  Fused (I-omega*D^{-1} A)*Ptent
  P size =  1700 x 216, nnz = 5000
  P Load balancing info
  P   # active processes: 4/4
  P   # rows per proc   : avg = 4.25e+02,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  P   #  nnz per proc   : avg = 1.25e+03,  dev =   0.1%,  min =   -0.1%,  max =   +0.1%
  P Communication info
  P   # num export send : avg =     0.00,  dev =   0.00,  min =    0.0 ,  max =    0.0
  P   # num import send : avg = 2.22e+01,  dev =   2.2%,  min =   -1.1%,  max =   +3.4%
  P   # num msgs        : avg =     3.00,  dev =   0.00,  min =    3.0 ,  max =    3.0
  P   # min msg size    : avg = 1.25e+00,  dev =  40.0%,  min =  -20.0%,  max =  +60.0%
  P   # max msg size    : avg = 1.20e+01,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
 Transpose P (MueLu::TransPFactory)
  R size =  216 x 1700, nnz = 5000
  R Load balancing info
  R   # active processes: 4/4
  R   # rows per proc   : avg = 5.40e+01,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  R   #  nnz per proc   : avg = 1.25e+03,  dev =   0.1%,  min =   -0.1%,  max =   +0.1%
  R Communication info
  R   # num export send : avg =     0.00,  dev =   0.00,  min =    0.0 ,  max =    0.0
  R   # num import send : avg = 7.28e+01,  dev =   0.7%,  min =   -1.0%,  max =   +0.3%
  R   # num msgs        : avg =     3.00,  dev =   0.00,  min =    3.0 ,  max =    3.0
  R   # min msg size    : avg = 1.25e+00,  dev =  40.0%,  min =  -20.0%,  max =  +60.0%
  R   # max msg size    : avg = 3.75e+01,  dev =   1.5%,  min =   -1.3%,  max =   +1.3%
 Computing Ac (MueLu::RAPFactory)
  MxM: A x P
   Matrix product nnz per row estimate = 10
  MxM: R x (AP) (explicit)
   Matrix product nnz per row estimate = 29
  Ac size =  216 x 216, nnz = 2150
  Ac Load balancing info
  Ac   # active processes: 4/4
  Ac   # rows per proc   : avg = 5.40e+01,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  Ac   #  nnz per proc   : avg = 5.38e+02,  dev =   0.1%,  min =   -0.1%,  max =   +0.1%
  Ac Communication info
  Ac   # num export send : avg =     0.00,  dev =   0.00,  min =    0.0 ,  max =    0.0
  Ac   # num import send : avg = 3.45e+01,  dev =   5.0%,  min =   -4.3%,  max =   +4.3%
  Ac   # num msgs        : avg =     3.00,  dev =   0.00,  min =    3.0 ,  max =    3.0
  Ac   # min msg size    : avg = 3.00e+00,  dev =  38.5%,  min =  -33.3%,  max =  +33.3%
  Ac   # max msg size    : avg = 1.80e+01,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
 Setup Smoother (MueLu::Ifpack2Smoother{type = RELAXATION})
  "Ifpack2::Relaxation": {Initialized: true, Computed: true, Type: Symmetric Gauss-Seidel, sweeps: 1, damping factor: 1, Global matrix dimensions: [216, 216], Global nnz: 2150}
MueLu::Amesos2Smoother: using "Superlu"
MueLu::AmesosSmoother: using "Superlu"
Using default factory (MueLu::SmootherFactory{pre = MueLu::DirectSolver{type = }, post = null}) for building 'CoarseSolver'.
Using default factory (MueLu::SmootherFactory{pre = MueLu::TrilinosSmoother{type = RELAXATION}, post = pre}) for building 'Smoother'.
Level 3
 Prolongator smoothing (MueLu::SaPFactory)
  Matrix filtering (MueLu::FilteredAFactory)
   Build (MueLu::CoalesceDropFactory)
    lightweight wrap = 1
    algorithm = "classical": threshold = 0.00, blocksize = 1
    Detected 0 Dirichlet nodes
    Number of dropped entries in unamalgamated matrix graph: 0/2150 (0.00%)
   Filtered matrix is not being constructed as no filtering is being done
  Build (MueLu::TentativePFactory)
   Build (MueLu::UncoupledAggregationFactory)
    Algo "Phase - (Dirichlet)"
     BuildAggregates (Phase - (Dirichlet))
       aggregated : 0 (phase), 0/216 [0.00%] (total)
       remaining  : 216
       aggregates : 0 (phase), 0 (total)
    Algo "Phase 1 (main)"
     BuildAggregates (Phase 1 (main))
       aggregated : 208 (phase), 208/216 [96.30%] (total)
       remaining  : 8
       aggregates : 32 (phase), 32 (total)
    Algo "Phase 2 (cleanup)"
     BuildAggregates (Phase 2 (cleanup))
       aggregated : 8 (phase), 216/216 [100.00%] (total)
       remaining  : 0
       aggregates : 0 (phase), 32 (total)
    Algo "Phase 3 (emergency)"
     BuildAggregates (Phase 3 (emergency))
       aggregated : 0 (phase), 216/216 [100.00%] (total)
       remaining  : 0
       aggregates : 0 (phase), 32 (total)
    Algo "Phase - (isolated)"
     BuildAggregates (Phase - (isolated))
       aggregated : 0 (phase), 216/216 [100.00%] (total)
       remaining  : 0
       aggregates : 0 (phase), 32 (total)
    "UC": MueLu::Aggregates{nGlobalAggregates = 32}
   Build (MueLu::AmalgamationFactory)
    AmalagamationFactory::Build(): found fullblocksize=1 and stridedblocksize=1 from strided maps. offset=0
   Nullspace factory (MueLu::NullspaceFactory)
   Build (MueLu::CoarseMapFactory)
    domainGIDOffset: 0 block size: 1 stridedBlockId: -1
   Column map is consistent with the row map, good.
   TentativePFactory : aggregates do not cross process boundaries
   
   ******* WARNING *******
   Level::Set: unable to store "Nullspace" generated by factory  on level 3, as it has not been requested and no keep flags were set for it
   Ptent size =  216 x 32, nnz = 216
   Ptent Load balancing info
   Ptent   # active processes: 4/4
   Ptent   # rows per proc   : avg = 5.40e+01,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
   Ptent   #  nnz per proc   : avg = 5.40e+01,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  Eigenvalue estimate
   Calculating max eigenvalue estimate now (max iters = 10)
   Prolongator damping factor = 0.94 (1.33 / 1.42)
  Fused (I-omega*D^{-1} A)*Ptent
  P size =  216 x 32, nnz = 728
  P Load balancing info
  P   # active processes: 4/4
  P   # rows per proc   : avg = 5.40e+01,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  P   #  nnz per proc   : avg = 1.82e+02,  dev =   1.3%,  min =   -1.6%,  max =   +1.6%
  P Communication info
  P   # num export send : avg =     0.00,  dev =   0.00,  min =    0.0 ,  max =    0.0
  P   # num import send : avg = 8.50e+00,  dev =   6.8%,  min =   -5.9%,  max =   +5.9%
  P   # num msgs        : avg =     3.00,  dev =   0.00,  min =    3.0 ,  max =    3.0
  P   # min msg size    : avg = 1.00e+00,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  P   # max msg size    : avg = 4.50e+00,  dev =  12.8%,  min =  -11.1%,  max =  +11.1%
 Transpose P (MueLu::TransPFactory)
  R size =  32 x 216, nnz = 728
  R Load balancing info
  R   # active processes: 4/4
  R   # rows per proc   : avg = 8.00e+00,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  R   #  nnz per proc   : avg = 1.82e+02,  dev =   1.3%,  min =   -1.6%,  max =   +1.6%
  R Communication info
  R   # num export send : avg =     0.00,  dev =   0.00,  min =    0.0 ,  max =    0.0
  R   # num import send : avg = 3.45e+01,  dev =   5.0%,  min =   -4.3%,  max =   +4.3%
  R   # num msgs        : avg =     3.00,  dev =   0.00,  min =    3.0 ,  max =    3.0
  R   # min msg size    : avg = 3.00e+00,  dev =  38.5%,  min =  -33.3%,  max =  +33.3%
  R   # max msg size    : avg = 1.80e+01,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
 Computing Ac (MueLu::RAPFactory)
  MxM: A x P
   Matrix product nnz per row estimate = 12
  MxM: R x (AP) (explicit)
   Matrix product nnz per row estimate = 33
  Ac size =  32 x 32, nnz = 434
  Ac Load balancing info
  Ac   # active processes: 4/4
  Ac   # rows per proc   : avg = 8.00e+00,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  Ac   #  nnz per proc   : avg = 1.08e+02,  dev =   3.2%,  min =   -3.2%,  max =   +3.2%
  Ac Communication info
  Ac   # num export send : avg =     0.00,  dev =   0.00,  min =    0.0 ,  max =    0.0
  Ac   # num import send : avg = 1.80e+01,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  Ac   # num msgs        : avg =     3.00,  dev =   0.00,  min =    3.0 ,  max =    3.0
  Ac   # min msg size    : avg = 4.00e+00,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
  Ac   # max msg size    : avg = 8.00e+00,  dev =   0.0%,  min =   +0.0%,  max =   +0.0%
 Setup Smoother (MueLu::Amesos2Smoother{type = <ignored>})

--------------------------------------------------------------------------------
---                            Multigrid Summary                             ---
--------------------------------------------------------------------------------
Number of levels    = 4
Operator complexity = 1.36

matrix  rows    nnz  nnz/row procs
A 0    10000  49600     4.96  4
A 1     1700  15318     9.01  4
A 2      216   2150     9.95  4
A 3       32    434    13.56  4

Smoother (level 0) both : "Ifpack2::Relaxation": {Initialized: true, Computed: true, Type: Symmetric Gauss-Seidel, sweeps: 1, damping factor: 1, Global matrix dimensions: [10000, 10000], Global nnz: 49600}

Smoother (level 1) both : "Ifpack2::Relaxation": {Initialized: true, Computed: true, Type: Symmetric Gauss-Seidel, sweeps: 1, damping factor: 1, Global matrix dimensions: [1700, 1700], Global nnz: 15318}

Smoother (level 2) both : "Ifpack2::Relaxation": {Initialized: true, Computed: true, Type: Symmetric Gauss-Seidel, sweeps: 1, damping factor: 1, Global matrix dimensions: [216, 216], Global nnz: 2150}

Smoother (level 3) pre  : <Direct> solver interface
Smoother (level 3) post : no smoother

