�J
TREE - Directory Tree
Version 1.21
Copyright (c) 1994 by C.P.U.

o� x���� �A2[�!!� ~ O(>/�� ~� �?���p���� �+6 #6 �!� ~�(͓("	�[ � y�@2[�@����^:[�@GY� ���~�(=6 ͓(6���~�(
6 ͓(���!^@�[	� ��^^� :^�? �2^���S�S	�o�)����_>�S!�F��*6 *	ͻ#~�(_��������͟���#~� ����h�͎��_>�S��<�ͪG~���N:[�(x<��~� ��!����x����z�[~�(������S����& o))))�w���������~W�(=G�������J���	��������~#� �~#�(0��������( ��V���������(Z��T���W��������^��[ � �>2ͪ~�( ��`�m�(:<2�>��6\#�����#x� ���:͋�+6 ![@ �`:����#6:#6\#�͠��~w�ɷ�ͪ�~ ���~��͠�~�(����6\#6 �<� �������
�������� ��������������	� ������9C �� ���H�! � �����E� ��:��\(:������k@!� !~� :[w#6:#6 ++~#� �++~�\(#�! ���:[2R:	� ![~�(_�� �#����#~� (��	(���!�N�:<2G:��=O:��y(=����� 7��> 2�> Gb� �� ��	� �X�>��>��>������      \TO.LST TO_PATH                                                                 A:\                                                                
*** Wrong version of TO.LST$
*** File for TO not found$
*** Directory not found in list$
Sorry, DOS 2.xx required.
$Press any key to continue... $M$Directory Tree of drive A:

$
TREE Version 1.21
Copyright (c) 1994 by C.P.U.

TREE is Public Domain!

Usage:
  TREE [d:][path] [/P] [/?]

Purpose:
  Displays all directories in a tree format

Options:
  /P   Pauses at bottom of screen
  /?   Shows this help screen

Examples:

A:\>TREE         ; Shows all dirs within the current dir of the current drive
A:\>TREE B:      ; Shows all dirs within the current dir of drive B:
A:\>TREE \UTILS  ; Shows all dirs within \UTILS of the current drive
A:\>TREE C:\ /P  ; Shows all dirs within the root dir of drive C: and pauses

$ 