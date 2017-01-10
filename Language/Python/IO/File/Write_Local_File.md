# Write the data to local file system with delimited form.

write the data out to a csv file
`
data.to_csv(path)
`

other delimiter can be used.

`
data.to_csv(path,sep = '|')
`

When it comes to empty value, you can  denote them by some other sentinel value instead of empty string.

`
data.to_csv(path,na_rep = 'NULL')
`

You can disable the row and column labels which are written with no other options.
`
data.to_csv(path,index = False,header = False)
`

You can output a subset of the columns
`
data.to_csv(path,index = False, cols = ["a","b","c"])
`

For any file with single-character delimiter ,you can pass it to csv.reader()
(Manually Working with Delimited Formats)

`
import csv
file = open(path)
reader = csv.reader(file)
`

`
with open('mydata.csv','w') as f
	writer = csv.writer(f)
	writer.writerow('one')
	writer.writerow('two')
	writer.writerow('three')
`