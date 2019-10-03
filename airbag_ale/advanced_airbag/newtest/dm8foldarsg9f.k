*KEYWORD 80000000
*TITLE
dm8foldarsg9f.k:  (UNIT: kg-mm-ms-K)    Courtesy of Mr. Dilip Bhalsod
$=================================LAGRANGIAN=CONTROL============================
*INCLUDE
dm8lagfold3.k
$==================CV==CONTROL====if use this, comment out ALE INCLUDE below====
$ *INCLUDE
$ dm8cvhybridporos2.k
$=================================ALE==CONTROL==================================
*INCLUDE
dm8ale2.k
$=================================ALE==MESH=====================================
*INCLUDE
dm8h23h24.k
$===============================================================================
$ /home/ian/lsdyna/demo/airbag/demo08/demo8flatale2/demo8flat2.k
$===============================================================================
$  S1 = Lagr. bottom half of airbag
$  S2 = Lagr. upper  half of airbag
$  S5 = Lagr. tether of airbag
$  S6 = Lagr. tether of airbag
$  S9 = Lagr. 2 vent patches of airbag  (S8 vent patch is converted to S9) 
$
$  S3 = Lagr. rigid rim of inflator
$  S4 = Lagr. rigid box of inflator
$
$ S22     = Lagr. rigid backing plane ~ steering wheel   (02-16-05)
$
$ H23     = AMMG2 = ALE inner mesh ~ no expansion  (02-16-05) replace H50000
$ H24     = AMMG2 = ALE outer mesh ~ expansion     (02-16-05) replace H50000
$ H25     = AMMG1 = inflator gas *SECTPTSRCMIX.    (02-16-05) replace H50003
$ H26     = AMMG3 = dummy inflator gas AMMGID, outside vent hole (02-17-05)
$
$ S100000 = Lagr. rigid dummy ring for defining 8 inflator orifices and vectors.
$
$ LCID1 = mdot(t) ;  LCID2 = Tgas(t) ;  LCID3 = vel(t) ; FAC=PORLCID=12
$===============================================================================
$ [ ] EXECUTION CONTROLS
$===============================================================================
*control_structured
*CONTROL_TERMINATION
$   ENDTIM    ENDCYC     DTMIN    ENDENG    ENDMAS 
      50.0         0 0.0000000         0 0.0000000
*CONTROL_TIMESTEP
$   DTINIT    TSSFAC      ISDO    TSLIMT     DT2MS      LCTM     ERODE     MS1ST
    0.0000       0.7         0 0.0000000 0.0000000         0         0         0
*CONTROL_SHELL
$   WRPANG    ITRIST     IRNXX    ISTUPD    THEORY       BWC     MITER      PROJ
      20.0         2        -1         0         2         2         1
$-------------------------------------------------------------------------------
$ IGNORE = ignore init penetration in contact_automatic: 
$        = 0 = move nodes to eliminate init penetration
$        = 1 = allow init penetration to exist by tracking them.
$-------------------------------------------------------------------------------
*CONTROL_CONTACT
$   SLSFAC    RWPNAL    ISLCHK    SHLTHK    PENOPT    THKCHG     ORIEN    ENMASS
 0.0000000 0.0000000         0         0         0         0         0
$   USRSTR    USRFRC     NSBCS    INTERM     XPENE     SSTHK      ECDT   TIEDPRJ
         0         0         0         0 0.0000000         0         0         0
$    SFRIC     DFRIC       EDC       VFC        TH     TH_SF    PEN_SF    FRCENG
         0
$   IGNORE    FRCENG
         1
*CONTROL_OUTPUT
$     NOPT    NEECHO    NREFUP    IACCOP     OPIFS    IPNINT    IKEDIT    IFLUSH
         0         0         0         0 0.0000000         0         0
*CONTROL_ENERGY
$    HGEN1     RWEN2   SLNTEN1    RYLEN1                     1=no;2=calc&include
         2         2         2         2
$===============================================================================
$ [ ] OUTPUT CONTROLS
$===============================================================================
*DATABASE_BINARY_D3PLOT
$  DT/CYCL   LCDT/NR      BEAM     NPLTC      PSID    ISTATS    TSTART      IAVG
       1.0                   0
*DATABASE_GLSTAT
$       DT    BINARY
       0.1         2
*DATABASE_MATSUM
$       DT    BINARY
       0.1         2
*DATABASE_ABSTAT
$       DT    BINARY
       0.1         2
*DATABASE_EXTENT_BINARY
$  NEIPHEX  NEIPSHEL  MAXINTSH   ISTRFLG   ISIGFLG   IEPSFLG   IRLTFLG   IENGFLG
         0         0         0         0         0         0         0         0
$ COORDFLG IEVERPLOT    BEAMIP DATCOMPRS     ISHGE    ISTSSZ   IN3THDT
         0         0         0         0         0         0
$-------------------------------------------------------------------------------
$ monitoring forces on the 2 tethers
*DATABASE_SECFORC
$       DT    BINARY
      0.10         2
*DATABASE_CROSS_SECTION_SET
$     NSID    HEXSID   BEAMSID     SHSID   THSHSID  DISCRSID        ID     IDTYP
         1         0         0         1         0         0         0         0
*DATABASE_CROSS_SECTION_SET
$     NSID    HEXSID   BEAMSID     SHSID   THSHSID  DISCRSID        ID     IDTYP
         2         0         0         2
*SET_NODE_LIST_TITLE
teather1
         1       0.0       0.0       0.0       0.0
      2585      2591      2596      2602      2608
*SET_NODE_LIST_TITLE
teather2
         2       0.0       0.0       0.0       0.0
      2640      2646      2651      2657      2663
*SET_SHELL_LIST_TITLE
terher1
         1       0.0       0.0       0.0       0.0
      2633      2638      2643      2648
*SET_SHELL_LIST_TITLE
teather2
         2       0.0       0.0       0.0       0.0
      2681      2686      2691      2696
$===============================================================================
*AIRBAG_SIMPLE_PRESSURE_VOLUME
$      SID    SIDTYP      RBID      VSCA      PSCA      VINI       MWD      SPSF
       129         1         0       1.0       1.0       0.0       0.0       0.0
$       CN      BETA      LCID
    1.0e-6    1.0e-6
$===============================================================================
$ 9 are vent holes <== couple with the vent holes too (mesh too coarse)
*SET_PART_LIST
       129
         1         2         3         4         5         6         9        10
*SET_PART_LIST
       126
         1         2         3         4         5         6
$===============================================================================
$ [ ] LAGRANGIAN CONTACTS CONSTRAINTS, ...
$ SSTYP= SLAVE set types:0=SGSID ; 1=SHSID ; 2=PSID ; 3=PID ; 4=NSID ; 6=PSID
$===============================================================================
$ self-contact of airbag parts: for PID 1,2,3,4,5,6,9: all airbag parts
*CONTACT_AIRBAG_SINGLE_SURFACE
$     SSID      MSID     SSTYP     MSTYP    SBOXID    MBOXID       SPR       MPR
       129         0         2         0         0         0         0         0
$       FS        FD        DC        VC       VDC    PENCHK        BT        DT
 0.5000000 0.0000000 0.0000000 0.0000000 0.0000000         0 0.0000000  0.000000
$      SFS       SFM       SST       MST      SFST      SFMT       FSF       VSF
 0.0000000 0.0000000 0.5000000 0.0000000 0.0000000 0.0000000
$     SOFT    SOFSCL    LCIDAB    MAXPAR      EDGE     DEPTH     BSORT    FRCFRQ
         2 0.0000000         0 0.0000000 0.0000000         3         5         0
$===============================================================================
$ contact of airbag to rigid backing plane (steering wheel)
*CONTACT_AUTOMATIC_SURFACE_TO_SURFACE
$     SSID      MSID     SSTYP     MSTYP    SBOXID    MBOXID       SPR       MPR
       129        22         2         3         0         0         0         0
$       FS        FD        DC        VC       VDC    PENCHK        BT        DT
 0.5000000 0.0000000 0.0000000 0.0000000 0.0000000         0 0.0000000  0.000000
$      SFS       SFM       SST       MST      SFST      SFMT       FSF       VSF
 0.0000000 0.0000000 0.5000000 0.0000000 0.0000000 0.0000000
$     SOFT    SOFSCL    LCIDAB    MAXPAR      EDGE     DEPTH     BSORT    FRCFRQ
         2 0.0000000         0 0.0000000 0.0000000         3         5         0
$===============================================================================
$ LAGRANGIAN PART DEFINITIONS
$===============================================================================
*PART
S1 = airbag top    : thick = 0.4 mm
$      PID     SECID       MID     EOSID      HGID      GRAV    ADPOPT      TMID
         1         1         1         0         0         0         0         0
*SECTION_SHELL
$    SECID    ELFORM      SHRF       NIP     PROPT   QR/IRID     ICOMP
         1         5 0.0000000 4.0000000 0.0000000 0.0000000         1
$       T1        T2        T3        T4      NLOC
 0.4000000 0.4000000 0.4000000 0.4000000 0.0000000
$       B1        B2        B3        B4        B5        B6        B7        B8
       0.0       0.0       0.0       0.0
*MAT_FABRIC
$      MID        RO        EA        EB        EC      PRBA      PRCA      PRCB
         1 8.7600E-7  .3000000  .2000000  .3000000  .2000000  .2000000  .2000000
$      GAB       GBC       GCA       CSE        EL       PRL    LRATIO      DAMP
  .0400000  .0400000  .0400000 1.0000000  .0600000  .3500000  .1000000  .2000000
$     AOPT       FLC       FAC       ELA      LNRC      FORM
$3.0000000     1.000    -17420
 3.0000000
$                                     A1        A2        A3
 1.0000000  .0000000  .0000000 1.0000000  .0000000  .0000000
$       V1        V2        V3        D1        D2        D3      BETA
 1.0000000  .0000000  .0000000  .0000000  .0000000  .0000000
$*DEFINE_CURVE
$       12           1.000E-06 1.000E+00   101.325         0
$             0.6895             0.00000
$             6.2053             0.35820
$            12.4106             0.65987
$            19.6502             0.94060
$            24.8213             1.11733
$            30.3371             1.31265
$            37.5767             1.53528
$            43.4372             1.72218
$            49.2978             1.91421
$            56.5374             2.14746
$            61.7085             2.34932
$===============================================================================
*PART
S2 = airbag bot    : thick = 0.4 mm
$      PID     SECID       MID     EOSID      HGID      GRAV    ADPOPT      TMID
         2         1         1         0         0         0         0         0
$===============================================================================
*PART
S9 = airbag vents  : thick = 0.4 mm (used to be S8 & S9)
$      PID     SECID       MID     EOSID      HGID      GRAV    ADPOPT      TMID
         9         1         1         0         0         0         0         0
*PART
S9 = airbag vents  : thick = 0.4 mm (used to be S8 & S9)
$      PID     SECID       MID     EOSID      HGID      GRAV    ADPOPT      TMID
        10         1         1         0         0         0         0         0
$===============================================================================
*PART
S5 = airbag teather 1 : thick = 0.4 mm
$      PID     SECID       MID     EOSID      HGID      GRAV    ADPOPT      TMID
         5         2         1         0         0         0         0         0
*SECTION_SHELL
$    SECID    ELFORM      SHRF       NIP     PROPT   QR/IRID     ICOMP
         2         5 0.0000000 4.0000000 0.0000000 0.0000000         1
$       T1        T2        T3        T4      NLOC
$2.0000000 2.0000000 2.0000000 2.0000000 0.0000000
 0.4000000 0.4000000 0.4000000 0.4000000 0.0000000
$       B1        B2        B3        B4        B5        B6        B7        B8
       0.0       0.0       0.0       0.0
$===============================================================================
*PART
S6 = airbag teather 2 : thick = 0.4 mm
$      PID     SECID       MID     EOSID      HGID      GRAV    ADPOPT      TMID
         6         2         1         0         0         0         0         0
$===============================================================================
*PART
S3 = rigid bagbase rim: thick = 0.4 mm
$      PID     SECID       MID     EOSID      HGID      GRAV    ADPOPT      TMID
         3         3         3         0         0         0         0         0
*SECTION_SHELL
$    SECID    ELFORM      SHRF       NIP     PROPT   QR/IRID     ICOMP
         3         5 0.0000000 4.0000000 0.0000000 0.0000000         1
$       T1        T2        T3        T4      NLOC
 0.4000000 0.4000000 0.4000000 0.4000000 0.0000000
$       B1        B2        B3        B4        B5        B6        B7        B8
       0.0       0.0       0.0       0.0
*MAT_RIGID
$      MID        RO         E        PR         N    COUPLE         M
         3 7.8500-06 2.0000000 0.3000000 0.0000000 0.0000000 0.0000000
$      CMO      CON1      CON2 
       1.0         0         0 
$       A1        A2        A3        V1        V2        V3   
 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000
$===============================================================================
*PART
S4 = rigid inflator can    : thick = 0.4 mm
$      PID     SECID       MID     EOSID      HGID      GRAV    ADPOPT      TMID
         4         3         3         0         0         0         0         0
$===============================================================================
*PART
S22 = rigid rigid backing plane (steering wheel) : thick = 0.4 mm
$      PID     SECID       MID     EOSID      HGID      GRAV    ADPOPT      TMID
        22         3         3         0         0         0         0         0
$===============================================================================
*PART
S100000 = dummy ring for locating point sources: thick = 0.4 mm
$      PID     SECID       MID     EOSID      HGID      GRAV    ADPOPT      TMID
    100000         3         3         0         0         0         0         0
$===============================================================================
$ [ ] BC's + IC's + BODY LOADS + FORCE FIELDS     VAD: 0=vel;1=accel;2=displace
$===============================================================================
*CONSTRAINED_RIGID_BODIES
$     PIDM      PIDS
        22         3
        22         4
        22    100000
$===============================================================================
$ S22 linear vel in x: 60km/hr = 60,000,000mm/3,600,000ms=16.66667mm/ms
*BOUNDARY_PRESCRIBED_MOTION_RIGID
$NID|NSID|PID    DOF       VAD      LCID        SF       VID     DEATH     BIRTH
        22         1         0        13       1.0         
*DEFINE_CURVE
        13
$               time  transl_vel (rad/t)
              0.0000             0.00000
             50.0000            16.66667
$===============================================================================
$ S22 rotational vel about a y-axis passing thru the CG of rigid S22: 
$ S22 rotational vel about y: 60deg*(PI/180deg)/40ms= 0.026179939 radians/ms
*BOUNDARY_PRESCRIBED_MOTION_RIGID_LOCAL
$NID|NSID|PID    DOF       VAD      LCID        SF       VID     DEATH     BIRTH
        22         6         0        14       1.0         
$ 
*DEFINE_CURVE
        14
$               time     rot_vel (rad/t)
              0.0000             0.00000
             10.0000             0.00000
             10.0001         0.026179939
             50.0000         0.026179939
$===============================================================================
*END
$===============================================================================









$===============================================================================
$ Bag is in x-y plane.  nx=40 ny=40 nz=27; dx= 893.38 dy= 878.38 dz= 593.33
$ dx & dy =16.5 to 23.364 = ALE elm width;  dz=22.4
$ bot of inflator can: Nid#1047120, xyz=     -50.5,         0,     -34.5
$
$ ALE lower-left nid:  Nid#1000002, xyz=  -446.688,   -439.19,     -33.5
$ ALE upper-right nid: Nid#1046352, xyz=   446.688,    439.19,   559.833
$
$ ALE new top nid:     Nid#1020717, xyz=  -446.688,         0,   223.833
$ new bot z:  3 elms below bot of inflator can = 3*dz~60.0 ==> z_bot=-94.0
$ nz= 30 ==> 
$ ALE new lower-left nid:  Nid#1000002, xyz=  -446.688,   -439.19,     -94.0
$ ALE new upper-right nid: Nid#1046352, xyz=   446.688,    439.19,     224.0
$ dz ~ 318/30=10.6 ==> 10.6*40 = 424 ==> 424/2=212
$ backlplane shell  z: Nid#   1067, xyz=  -66, -16.5,    -1         dx~16.5
$ backlplane shell PID Nid#1097609, xyz= -450,  -450,   224
$ backlplane shell PID Nid#1097608, xyz=  450,   450, 213.4
$ backlplane shell PID: [-450,-450,-1]  to [450,450,-1] :  26X26 elms
$===============================================================================



