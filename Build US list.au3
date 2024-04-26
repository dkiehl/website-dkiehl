#include <Array.au3>
#include <DAK.au3>
#include <File.au3>

$xx = ''
$xx = ClipGet()
if StringRight($xx,4) <> '.m3u' then
	$xx = ''
EndIf

$file = InputBox('Select File','Enter full path of M3U file',$xx)
if @error <> 0 then Exit

Global $grp[1]
Global $ar[1]
Global $mytv[1]
_FileReadToArray($file,$ar,0)
_FileReadToArray('E:\WebServers\Kiehl.net\tv\Groups - Keep.txt',$grp)
_FileReadToArray('E:\WebServers\Kiehl.net\tv\DAK-TV.m3u',$mytv)
$out = FileOpen('E:\WebServers\Kiehl.net\tv\US.m3u',2)

$c = 0
$lpct = 0
ProgressOn("Building US List",'Processing...','',Default,Default,16)
filewriteline($out,$ar[0])

for $i = 1 to UBound($mytv) - 1
	FileWriteLine($out,$mytv[$i] & @CRLF)
Next

$max = UBound($ar) - 1
for $i = 1 to $max step 2
	$pct = int($i / $max * 100)
	if $pct <> $lpct then
		ProgressSet($pct,$pct & ' %','Parsing Streams')
		$lpct = $pct
	EndIf
	$x = $ar[$i]
	$j = StringInStr($x,'group-title=')
	if $j > 0 Then
		$x = StringMid($x,$j+13)
		$j = StringInStr($x,'"')
		$x = StringMid($x,1,$j-1)
		if _ArraySearch($grp,$x) > -1 then
			FileWriteLine($out,$ar[$i] & @CRLF)
			FileWriteLine($out,$ar[$i+1] & @CRLF)
			$c += 1
		EndIf
	EndIf
Next
fileclose($out)
ProgressOff()
