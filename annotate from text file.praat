# This is a Praat script that annotate all odd annotations from selected TextGrid using text file.
# Compare with http://www.helsinki.fi/%7Elennes/praat-scripts/public/label_from_text_file.praat

# This script is distributed under the GNU General Public License.
# George Moroz 11.09.2017

# read all files from the selected directory -------------------------------------------------------

form Open all files in directory
  comment Provide path to the file with stimuli:
  text resultfile /home/agricolamz/_DATA/OneDrive1/_Work/Scripts/_Praat/annotate from text file/stimuli.txt
  comment Which tier should be annotated:
  integer anntier 1
endform

grid = selected ("TextGrid", 1)
Read Strings from raw text file: resultfile$
annotfile = selected ("Strings", 1)
n_annotation = Get number of strings
for i from 1 to n_annotation
	selectObject: annotfile
	annotation$ = Get string: i
	selectObject: grid
	Replace interval text: anntier, i*2, i*2, "", annotation$, "Literals"
endfor
selectObject: annotfile
Remove
