#Solution(4)
library("arules")
transactions <- read.transactions(file = "ratingsAsBasket.txt", format = "basket",rm.duplicates="FALSE")
summary(transactions)
transactions.apriori <- apriori(transactions)
inspect(transactions.apriori[1:10])
transactions.subset <- subset(transactions.apriori, subset = lift > 3.0)
inspect(transactions.subset)

#Solution(5 (a))

directory <- c("/home/kevin/DataMining/DataMiningHW4/rec.motorcycles","/home/kevin/DataMining/DataMiningHW4/rec.autos")
dir_source <- DirSource(directory = directory, encoding = "UTF-8")
news.corpus <- VCorpus(dir_source, readerControl = list(reader = reader(dir_source)))
#<<VCorpus (documents: 1986, metadata (corpus/indexed): 0/0)>>
length(news.corpus)
news.corpus[[980]]
# <<PlainTextDocument (metadata: 7)>>
# From: cheekeen@tartarus.uwa.edu.au (Desmond Chan)
# Subject: Re: Honda clutch chatter
# Organization: The University of Western Australia
# Lines: 8
# NNTP-Posting-Host: tartarus.uwa.edu.au
# X-Newsreader: NN version 6.4.19 #1

#      I also experience this kinda problem in my 89 BMW 318. During cold
# start ups, the clutch seems to be sticky and everytime i drive out, for
# about 5km, the clutch seems to stick onto somewhere that if i depress
# the clutch, the whole chassis moves along. But after preheating, it
# becomes smooth again. I think that your suggestion of being some
# humudity is right but there should be some remedy. I also found out that
# my clutch is already thin but still alright for a couple grand more!


#Solution (5 (b))
# Applying the removePunctuation over the news.corpus
news.corpus <- tm_map(news.corpus, removePunctuation)
news.corpus <- VCorpus(VectorSource(news.corpus))

news.corpus[[980]]
# <<PlainTextDocument (metadata: 7)>>
# From cheekeentartarusuwaeduau Desmond Chan
# Subject Re Honda clutch chatter
# Organization The University of Western Australia
# Lines 8
# NNTPPostingHost tartarusuwaeduau
# XNewsreader NN version 6419 1

#      I also experience this kinda problem in my 89 BMW 318 During cold
# start ups the clutch seems to be sticky and everytime i drive out for
# about 5km the clutch seems to stick onto somewhere that if i depress
# the clutch the whole chassis moves along But after preheating it
# becomes smooth again I think that your suggestion of being some
# humudity is right but there should be some remedy I also found out that
# my clutch is already thin but still alright for a couple grand more



# Applying removeNumbers over news.corpus

news.corpus <- tm_map(news.corpus, removeNumbers)
news.corpus <- VCorpus(VectorSource(news.corpus))
news.corpus[980]
# <<PlainTextDocument (metadata: 7)>>
# From cheekeentartarusuwaeduau Desmond Chan
# Subject Re Honda clutch chatter
# Organization The University of Western Australia
# Lines 
# NNTPPostingHost tartarusuwaeduau
# XNewsreader NN version  

#      I also experience this kinda problem in my  BMW  During cold
# start ups the clutch seems to be sticky and everytime i drive out for
# about km the clutch seems to stick onto somewhere that if i depress
# the clutch the whole chassis moves along But after preheating it
# becomes smooth again I think that your suggestion of being some
# humudity is right but there should be some remedy I also found out that
# my clutch is already thin but still alright for a couple grand more

# Applying tolower to news.corpus
news.corpus <- tm_map(news.corpus, tolower)
news.corpus <- VCorpus(VectorSource(news.corpus))
news.corpus[[980]]
# <<PlainTextDocument (metadata: 7)>>
# from cheekeentartarusuwaeduau desmond chan
# subject re honda clutch chatter
# organization the university of western australia
# lines 
# nntppostinghost tartarusuwaeduau
# xnewsreader nn version  

#      i also experience this kinda problem in my  bmw  during cold
# start ups the clutch seems to be sticky and everytime i drive out for
# about km the clutch seems to stick onto somewhere that if i depress
# the clutch the whole chassis moves along but after preheating it
# becomes smooth again i think that your suggestion of being some
# humudity is right but there should be some remedy i also found out that
# my clutch is already thin but still alright for a couple grand more



# Applying removeWords stopwords("english")
news.corpus <- tm_map(news.corpus, removeWords, stopwords("english"))
news.corpus <- VCorpus(VectorSource(news.corpus))
news.corpus[[980]]

# <<PlainTextDocument (metadata: 7)>>
#  cheekeentartarusuwaeduau desmond chan
# subject re honda clutch chatter
# organization  university  western australia
# lines 
# nntppostinghost tartarusuwaeduau
# xnewsreader nn version  

#       also experience  kinda problem    bmw   cold
# start ups  clutch seems   sticky  everytime  drive  
#  km  clutch seems  stick onto somewhere    depress
#  clutch  whole chassis moves along   preheating 
# becomes smooth   think   suggestion   
# humudity  right      remedy  also found  
#  clutch  already thin  still alright   couple grand

# Solution (5 (c))
dtm <- DocumentTermMatrix(news.corpus, control = list(minWordLength = 1, minDocFreq = 1))
> dim(dtm)
[1]  1986 22213

> dtm
# <<DocumentTermMatrix (documents: 1986, terms: 22213)>>
# Non-/sparse entries: 175981/43939037
# Sparsity           : 100%
# Maximal term length: 163
# Weighting          : term frequency (tf)

inspect(news.corpus[980])
# <<VCorpus (documents: 1, metadata (corpus/indexed): 0/0)>>

# [[1]]
# <<PlainTextDocument (metadata: 7)>>
#  cheekeentartarusuwaeduau desmond chan
# subject re honda clutch chatter
# organization  university  western australia
# lines 
# nntppostinghost tartarusuwaeduau
# xnewsreader nn version  

#       also experience  kinda problem    bmw   cold
# start ups  clutch seems   sticky  everytime  drive  
#  km  clutch seems  stick onto somewhere    depress
#  clutch  whole chassis moves along   preheating 
# becomes smooth   think   suggestion   
# humudity  right      remedy  also found  
#  clutch  already thin  still alright   couple grand 

