getwd()
setwd("C:\\Users\\cgt\\Desktop\\nadia_bolsas-xml")
# Load the packages required to read XML files.
library("XML")
library("methods")

xmlfile <- xmlParse("hst_pgt_bolsas_cnpq_2017.xml")
#xmltop <- xmlRoot(xmlfile)
#xmlName(xmltop)

# saveXML(xmlfile, file = "bolsa_2017.xml", compression = 0, indent = TRUE, encoding = "UTF-8")
xml <- saveXML(xmlfile, file = NULL, compression = 0, indent = TRUE, encoding = "UTF-8")

# converte xml para data frame
df_xml <- xmlToDataFrame(xml)

# obtem os nomes das colunas
nomes_hifen <- names(df_xml)

# mudando o - por _ nos nomes das variaveis
nomes_underline <- gsub("-", "_", nomes_hifen)

# atribuindo os nomes corretos de volta ao df
names(df_xml) <- nomes_underline

# Convert the input xml file to a data frame.
#xmldataframe <- xmlToDataFrame("hst_pgt_bolsas_cnpq_2017.xml")

#grava o arquivo 
write.xlsx(df_xml, "bolsas_2017.xlsx")




