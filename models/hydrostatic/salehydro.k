*KEYWORD
*CONTROL_STRUCTURED
*TITLE
 channel fluid problem                                   
*CONTROL_TERMINATION
  0.007000         0 0.0000000         0 0.0000000
*CONTROL_TIMESTEP
 1.00000-5 0.6000000         0 0.0000000 0.0000000         0    0
*CONTROL_SHELL
 0.0000000         0         0         0         0         0
*CONTROL_DAMPING
         0 0.0000000 0.0000000 0.0000000 0.0000000         0 0.0000000         0
*CONTROL_CONTACT
 0.0000000 0.0000000         0         0         0         0         0
         0         0         0         0
*CONTROL_OUTPUT
         0         0         0         0 0.0000000         0         0
*CONTROL_ENERGY
         0         0         0         0
*DATABASE_BINARY_D3PLOT
 0.0000001                   0
*DATABASE_EXTENT_BINARY
         2         0         0         0         0         0         0         0
         0         0
*DATABASE_GLSTAT
 2000.0000
*CONTROL_CPU
 0.0000000
*ALE_STRUCTURED_MESH
$    mshid       pid      nbid      ebid      ityp    nparts
         1         1      1001         1         0         0
$     nptx      npty      nptz      nid0     lcsid
      3001      3002      3003
*ALE_STRUCTURED_MESH_CONTROL_POINTS
      3001         0         1     1.000     0.000     0.000         0
                   1                 0.0
                  25               0.200
*ALE_STRUCTURED_MESH_CONTROL_POINTS
      3002         0         1     1.000     0.000     0.000         0
                   1                0.00
                   8               0.040
*ALE_STRUCTURED_MESH_CONTROL_POINTS
      3003         0         1     1.000     0.000     0.000         0
                   1                0.00
                   2               0.010
*BOUNDARY_SPC_SET
         1                   0         1         1
*SET_NODE_GENERAL
$      SID
         1
$   OPTION     MSHID       XMN       XMX       YMN       YMX       ZMN       ZMX
   SALECPT         1         1        25         1         8         1         2
*BOUNDARY_PRESCRIBED_MOTION_SET
         2         1         0         1 1.00000+0         0
*SET_NODE_GENERAL
$      SID
         2
$   OPTION     MSHID       XMN       XMX       YMN       YMX       ZMN       ZMX
   SALECPT         1         1         2         1         8         1         2
*DEFINE_CURVE
         1         0 0.0000000 0.0000000 0.0000000 0.0000000
      0.00000000E+00      1.00000000E+02
      1.00000000E+06      1.00000000E+02
*INITIAL_VELOCITY
$     NSID
         1
$       vx
      100.
*SET_SOLID_GENERAL
$      SID
         1
$   OPTION     MSHID       XMN       XMX       YMN       YMX       ZMN       ZMX
   SALECPT         1         1         2         1         8         1         2
*INITIAL_VOLUME_FRACTION_GEOMETRY
$FPID/PSID FLMIDTYPE INIAMMGID                 : FLMIDTYPE =0=PSID, 1=PID
         1         1         1
$ CONTTYPE   FILLOPT  FFLUIDID                 : CONTTYP=3="PLANE", above w mmg2
         3         0         2
$       X0        Y0        Z0        NX        NY        NZ
       0.0      0.02       0.0       0.0       1.0       0.0
*PART
H11 = AMMG1 = water iy: 1-5
$      PID     SECID       MID     EOSID      HGID      GRAV    ADPOPT      TMID
        11        11        11        11        11
*SECTION_SOLID
$    SECID    ELFORM       AET
        11        11
*MAT_NULL
$      MID        RO        PC        MU     TEROD     CEROD        YM        PR
        11 998.00000 -10.00000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000
*EOS_LINEAR_POLYNOMIAL
$    EOSID        C0        C1        C2        C3        C4        C5        C6
        11 0.00000+0 2.2500E+3 0.0000000 0.0000000 0.0000000 0.0000000 0.00000+1
$       E0        V0
 0.0000000
*HOURGLASS
$     HGID       IHQ        QM       IBQ        Q1        Q2        QB        QW
        11         1    1.0e-6
$-------------------------------------------------------------------------------
*PART
H12 = AMMG2 = half-density water = lighter water  iy: 5-8
$      PID     SECID       MID     EOSID      HGID      GRAV    ADPOPT      TMID
        12        11        12        12        11
*MAT_NULL
$      MID        RO        PC        MU     TEROD     CEROD        YM        PR
        12 449.00000 -10.00000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000
*EOS_LINEAR_POLYNOMIAL
$    EOSID        C0        C1        C2        C3        C4        C5        C6
        12 0.00000+0 2.2500E+3 0.0000000 0.0000000 0.0000000 0.0000000 0.00000+1
$       E0        V0
 0.0000000
*ALE_MULTI-MATERIAL_GROUP
$      SID    IDTYPE AMMG_NAME   SIDTYPE=SID-type: SIDTYPE=0=PSID; SIDTYPE=1=PID
        11         1 1heavy
        12         1 2light
*CONTROL_ALE
$#     dct      nadv      meth      afac      bfac      cfac      dfac      efac
         0         1         1 -1.000000
$#   start       end     aafac     vfact      prit       ebc      pref   nsidebc
     0.000     0.000     0.000     0.000     0.000         0     0.000         0
*INITIAL_HYDROSTATIC_ALE
         2         2       101     0.098       0.0
       999         2
       998         1
*SET_SOLID_GENERAL
$      SID
         2
$   OPTION     MSHID       XMN       XMX       YMN       YMX       ZMN       ZMX
   SALECPT         1         2        25         1         8         1         2
*DEFINE_VECTOR
       101       0.0       1.0       0.0       0.0       0.0       0.0
*BOUNDARY_PRESCRIBED_MOTION_NODE
       998         2         0      8888    
*DEFINE_CURVE
      8888         0 0.0000000 0.0000000 0.0000000 0.0000000
      0.00000000E+00      0.00000000E+00
      0.00100000E+00      10.0000000E+00
      0.00200000E+00      0.00000000E+00
      0.00300000E+00      -10.000000E+00
      0.00400000E+00      -10.000000E+00
      0.00500000E+00      0.00000000E+00
      0.00600000E+00      10.0000000E+00
      0.00700000E+00      0.00000000E+00
      0.00800000E+00      0.00000000E+00
*NODE
     999 0.000000000E+00 0.040000000E+00 0.000000000E+00       7       0
     998 0.000000000E+00 0.020000000E+00 0.000000000E+00       7       0
*ALE_AMBIENT_HYDROSTATIC
         3         2       101     0.098       0.0
       999         2
       998         1
*SET_SOLID_GENERAL
$      SID
         3
$   OPTION     MSHID       XMN       XMX       YMN       YMX       ZMN       ZMX
   SALECPT         1         1         2         1         8         1         2
*END
