library(rvest)
library(httr)
library(dplyr) 
library(polite)
library(stringr)
library(ggplot2)
library(readr)
polite::use_manners(save_as = 'polite_scrape.R')


session <- bow(url = 'https://www.imdb.com/title/tt4779682/reviews?ref_=tt_urv' , user_agent = "Educational")

session

session_scrape <- scrape(session)

tm_reviews <- function(page_url) {
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  the_meg2_df = data.frame(
    Movie_Name=c('The Meg 2'),
    Reviewer_Name = names[1:25],
    Content_Review = content_reviews[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Reviews = reviews[1:25]
  )
}


tm_urls<-c(  'https://www.imdb.com/title/tt4779682/reviews?ref_=tt_urv',
             'https://www.imdb.com/title/tt4779682/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzurtumwar42mpdx77eate7sul5pjt6uckzo43fzmbkb4dxvaffk4igv5k64rhh7kqjtj7ac',
             'https://www.imdb.com/title/tt4779682/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbxrlqmycbt3uotb6hla3cpqvt5pjt6uckzpa4fxmzlb4d5fd57ksqqaczntizg2w2fn5qg2',
             'https://www.imdb.com/title/tt4779682/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbrr7s4sbrz3aptt7pfa7cpqw35pjt6uckzo43vvnrib4d72g224tswfi5pizl5ucrugal74',
             'https://www.imdb.com/title/tt4779682/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjwrxumqaj73and56xmapc74vl5pjt6uckyoi2fjmzjb4dvkm7ed6caww6idfdmy2qluyu7u',
             'https://www.imdb.com/title/tt4779682/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjxr3umobzy3iod577pb3c7wulcoq366ss7oi4v3mbjdj4k56rs42o7cs7g5laj2xebr3kuy3y',
             'https://www.imdb.com/title/tt4779682/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjurxr46az52mnt377lahapev3eoq366ss7oi4v3mzcd54k4lreoo6ugxkclb6shorfpl3x6ba',
             'https://www.imdb.com/title/tt4779682/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrwqlrmsaj43aktx4peb3dpeutcoq366ss5oqyfxnjpdb4k5p5gerkiyfmxpierahjkb7wvnea',
             'https://www.imdb.com/title/tt4779682/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjvr7smuaj73iktb7hkatcpetttfjrksd24oy3vjmryobyawq4qoqfk3t6crhrwxw2nibeq',
             'https://www.imdb.com/title/tt4779682/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjqqpt46cb63ypdr67maxdpyvlcoq366ss4o42vxmrkcr4k4f64zvd4gw6xokshrho2pugff2a',
             'https://www.imdb.com/title/tt4779682/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjrrtq44ab73iot367papb7evl5pjt6uckzpayvxnjob4dqjt44dvczck7k4f6l2y64esdsi',
             'https://www.imdb.com/title/tt4779682/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmryrhsm6ar43qmdb6hkb7c7yu3eoq366ss5oayfzpzkdz4k4efwyzqrwf42u2hhlaueaj7m37y'
)


TM2_reviews <- lapply(tm_urls, tm_reviews)
TheMeg2_Review <- do.call(rbind, TM2_reviews)
View(TheMeg2_Review)


#2nd Movie

session <- bow(url = 'https://www.imdb.com/title/tt17351924/reviews?ref_=tt_urv', user_agent = "Educational")

session

session_scrape <- scrape(session)

Saltburn_reviews <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  sb_df= data.frame(
    Movie_Name=c('Saltburn'),
    Reviewer_Name = names[1:25],
    Content_Review = content_reviews[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Reviews = reviews[1:25]
  )
}

urls<-c('https://www.imdb.com/title/tt17351924/reviews?ref_=tt_urv',
        'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrvrxq4oab62motb77faxcpuul5pjt6ubc7ouzfjnrcb4d23i275p2px3kvhogku35tid4c4',
        'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnztrdr4uajz3mpdx77la7dpww35pjt6ubc6pe4vvprlb4dztfta4ew64mpjq5d4zkld4tvao',
        'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbwrlq46ajt3mpdr7hja7c7yul5pjt6ubc6oq2v7prnb4dzgei3zia4ibcxsk3ycjgo5fvco',
        'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbqrhqmqcb434nd37hia7b76w35pjt6ubc6oeyvtnjob4dtxb2zl77wgkbj2twtwx2dkoeow',
        'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjyqps4yab33upd377fa3cp2v3hoq366sssou2vtpzmcr4k52m4krzo4hmop55lb2cyr6qez6y',
        'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjzqlumybr52mmd36xpale7sutfoq366sssoq2v5mjncv4k425zel3hpn2ny2eadmyfgwmw55y',
        'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjwrlum2bjy3aptb7xpatc72ul5pjt6ubc6om3fxmjcb4dv3t7z3svojobkx6uhnp2dmajlq',
        'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjvrds4wazt2iodr4platd7wud5pjt6ubc6ou2f3nrlb4dywe5aag3a3vlqczb5ppkmb7cng',
        'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjqqps46az63iotz6hjahdpeul5pjt6ubc6oi3fvnblb4dzuxef22zunrtef6ljhyqbd3tyk',
        'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmryqpqmmajy3andt7hlapep4udgoq366sssouyfxmrnd54k4x5mkj7xdxka5qrc2odjv6sfhni',
        'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrzrhq42bbs3mpt36hfb3a7ev35pjt6ubc6oq2flnblb4d4kr34jmkf2c23spfcrkgzbgly4'
)

S_reviews <- lapply(urls, Saltburn_reviews)
Saltburn_Review <- do.call(rbind, S_reviews)
View(Saltburn_Review)


#3rd Movie

session <- bow(url = 'https://www.imdb.com/title/tt9362722/reviews/?ref_=tt_ov_rt', user_agent = "Educational")

session

session_scrape <- scrape(session)

Spidey_reviews <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  sp_df= data.frame(
    Movie_Name=c('Spiderman'),
    Reviewer_Name = names[1:25],
    Content_Review = content_reviews[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Reviews = reviews[1:25]
  )
}

spidey_urls<-c('https://www.imdb.com/title/tt9362722/reviews/?ref_=tt_ov_rt',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzwrdsmubz53eotd6xlaxbomqbdf4wk2bc4oqzvljchz4xjc7vm6hbfpdsu7jlk5ylguq',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbwr7u4ybj22ipd56heaxc7uvd5pjt6ubczomzftpzcb4d4ng2yjwuljoq25yhbr6dgpjsb2',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbxrds42aby3iod37hka7d76vt5pjt6ubc2oe2ftnbpb4dvkn7gz2f7wttxpgtwh26r57zwi',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnburls4mbz63mkd54heb7a76ul5pjt6ubczouyv7njpb4d5oqzigz5exbk2tqpzzdgjrmovc',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbsr3tmyabz2mkdx7xjald74vl5pjt6ubc2oe2v5nbjb4dvorkmfgom6utud4dssppwe63iu',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbtrdr4sazy3umtz67mapepuw35pjt6ubc3pe4v5mzmb4d47czx3ubw6xpydwqw5w2gadbyy',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjzrtr4waj53qptr77pb7dpqulgoq366sssoi2fjnrcdv4k4r6moviljhn2sodz6yhoo2jzt6a',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjwqpsmmaz72mptz4hkalep2udcoq366sssoi3vrpzidf4k5iyl4t7ebr4tzfxvw4i4ccaa4zi',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjxrtr4obz42mmdx4hfb7ep2wtfoq366sssoiyvxpzpdf4k4ivvidjqdu7lutllww4v3zht57y',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjuqlt44az53qntd4hjaxbpuvdgoq366sssoi2fxprkdn4k5r5odnovbjehkywmdm7bdwgy66q',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjurptmsbr33aptb4pfa7cpwtttfjrkidc6ou4f5pzyock2535jsoyr4y25n23zk2xwicra'
)

sp_reviews <- lapply(spidey_urls, Spidey_reviews)
Spiderman_Review <- do.call(rbind, sp_reviews)
View(Spiderman_Review)

#4th Movie

session <- bow(url = 'https://www.imdb.com/title/tt9362722/reviews/?ref_=tt_ov_rt', user_agent = "Educational")

session

session_scrape <- scrape(session)

PussB_reviews <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  sp_df= data.frame(
    Movie_Name=c('Puss N Boots'),
    Reviewer_Name = names[1:25],
    Content_Review = content_reviews[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Reviews = reviews[1:25]
  )
}

puss_urls<-c('https://www.imdb.com/title/tt3915174/reviews?ref_=tt_urv',
             'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzvqltmyars3ikd57xjb7c7yv35pjt6ubktou4vvnjdb4dqjgyyo7ci5i5gce2ur66cibz36',
             'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbqr3rmscj53yndv6hiapdp2wt5pjt6ubksom2fvprcb4d6rdxh3ndafvnhsotfpxb456ijq',
             'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjsr3t46ar73akdb6ppa3dpsv35pjt6ubkspayfjmbmb4d7lh2m6yp7xlgo32h6ve56tp7e6',
             'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrzr3umuar33yodb7pmb3bpgud5pjt6ubksoe4flmbnb4dsbofscyhfgewd5fyx3hajzwizm',
             'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrvrxt44cby2imtr7pfaxcpuvd5pjt6ubk4pe2v7njpb4d4j2f7khfgpb7s4cgobbcgaeh32',
             'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrtqlu4wbry2ikdb67jahe76ud5pjt6ubktoyzvtnbjb4d6nuwtg22yxgeg3ad5o3jdkhqbe',
             'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrqrps4qbz32imdz4hlb7cpgu35pjt6ubczom2vrmzdb4dsv7h5tai24wqjhu6c3o254ux2a',
             'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmrrrlum4ab33aodd6hfb3bpyudeoq366ssto43vznjcdr4k4axsgle44esrgjvnvcywpucik2y',
             'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmzzqpsmybzz3upd767mb7ep4vtfoq366ssto44f5nrpdf4k4554up46pyet4ck3ge3n5nr466y',
             'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmzwqpq42aj73amd54hoaha7evl5pjt6ubc3oq2vvnrjb4dxf3udoz6camgz2jq55ru7fs5xw',
             'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjmzxrxr4mcb63amdb6xiapd72vd5pjt6ubktouzfvmrkb4dslvlvsd5cdrnskibgdjdzq5nqy'
)

pnb_reviews <- lapply(puss_urls, PussB_reviews)
Puss_N_Boots_Review <- do.call(rbind, pnb_reviews)
View(Puss_N_Boots_Review)


#5th Movie

session <- bow(url = 'https://www.imdb.com/title/tt1160419/reviews/?ref_=tt_ov_rt', user_agent = "Educational")

session

session_scrape <- scrape(session)

Dune_reviews <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  dune_df= data.frame(
    Movie_Name=c('Dune'),
    Reviewer_Name = names[1:25],
    Content_Review = content_reviews[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Reviews = reviews[1:25]
  )
}

dune_urls<-c('https://www.imdb.com/title/tt1160419/reviews/?ref_=tt_ov_rt',
             'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrzr7r4majy2imt777naxcp2vd5pjt6ucs7o42f7prkb4d22bctudy6rwgsieg4xwmai636i',
             'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrxqpt44ar63ykdr6xeahcpgv35pjt6ucsyouyvrnzlb4dy3nnqcxzpcehthkknn4cd2jgyk',
             'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrxrtq44brs2mndd7hpaxc76vl5pjt6ubk2ouzflnznb4drpu3tofcv5alesygwwxnsgvwik',
             'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrxr3smqbj534kt37xnahc74vd5pjt6ucsype4f7nbmb4d7oaae2ii7xl6oxrbxiw3amyh5i',
             'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrxrps4oaz73ymdz67nadbpwvd5pjt6ucsyou4v7nbkb4dzv6wjn4zamjv33v5j6uaqfxmt2',
             'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnruqltmobjy3yntx4hkahbpyvt5pjt6ubczo44fxnjlb4dwmt7tb4rjubzj22b4vtk6ck6ai',
             'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrurpqmqaz634odr4hib3ep4vt5pjt6ucsyoyzvvmblb4d5sckcu2whbif7sudupxmtbdtc6',
             'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrvr3smobz23untv6pfaxep2tttfjrkudsto44f5nbyoat2llh7gysc37z5pla3bggd2noq',
             'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrsrttmucj334mtt7pia3cpgwt5pjt6ucsypeyvvnzmb4d3chrfvjchyxnyklikeuohfffgq',
             'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrtrtumwarz34pd74pfa7dpgvt5pjt6ucsyou3vrnbjb4ds6wvdagflvmgunvo6e64ly3pjq',
             'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrqqlqmmbbt3qpdz7xmb3dpsud5pjt6ucsyoq4fxprcb4d7bpmaa3nefx6tf3zkew66gav5y'
)

dune_reviews <- lapply(dune_urls, Dune_reviews)
Dune_Review <- do.call(rbind, dune_reviews)
View(Dune_Review)

#6th Movie

session <- bow(url = 'https://www.imdb.com/title/tt0816692/reviews/?ref_=tt_ov_rt', user_agent = "Educational")

session

session_scrape <- scrape(session)

Interstellar_reviews <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  Inter_df= data.frame(
    Movie_Name=c('Interstellar'),
    Reviewer_Name = names[1:25],
    Content_Review = content_reviews[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Reviews = reviews[1:25]
  )
}

Inter_urls<-c('https://www.imdb.com/title/tt0816692/reviews/?ref_=tt_ov_rt',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzwrdtm4abs2mmdr7hfapepev35pjt6ubkyoa3flprob4d6rlkbdz55anux36r74i4zdesjk',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbzr7q4oab63ymtx6hib3a7wwt5pjt6uds2pa4f7mzob4dym6publcq3sjd5ofhlzsculcxo',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbvrpq44az73imdt4hkb7cpwvd5pjt6uds2oe3frnbib4dwhykabb7kjn3tlwn336nfz4a4i',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbqqpsmubjs3upd37pna3c7gvl5pjt6uds2oi3vlmrmb4d3wojabrgw2hb2k3ojijrch7tpq',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjyrtsmyazz3mmt74hea3c7sud5pjt6uds2oe4f7mjpb4dwtjtlgtmpvzpfr46mrre7b7qng',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjzrdsmmcb43yndx67ob3e74vthoq366ss6o43f7nzodv4k5nlmqiktgt7o7kcg3sbigspsq5q',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjwr7tmscb43eodv7hmade7wtttfjrk4dc2pa4v5mryodiyuczrtil2rjlorf6qrent5nua',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjwrlq44azs3qmtv7pea3d7uudhoq366ss5oayvjmbldb4k5zumjbgeeqbj3mkhjxtqtiypj3a',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjxr7q4ybzz3indz7hjahc7gulfoq366ssyoiyf7nrmdv4k5a3ek7wvx3modf3r74ujjhzxpdi',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjxrlqmobj33uot74pla7c7ev35pjt6uds2omzf3pzcb4dxuspjrj2qeoz3tn4hymbcwxtp2',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjur7u44ab23qktt4hmaxb7uud5pjt6uds7oe2vvnzdb4dvnax375yg6rld4vkxlhgaaowlq'
)

Int_reviews <- lapply(Inter_urls, Interstellar_reviews)
Interstellar_Review <- do.call(rbind, Int_reviews)
View(Interstellar_Review)


#7th Movie

session <- bow(url = 'https://www.imdb.com/title/tt0468569/reviews/?ref_=tt_ov_rt', user_agent = "Educational")

session

session_scrape <- scrape(session)

Batman_reviews <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  Inter_df= data.frame(
    Movie_Name=c('The Dark Knight'),
    Reviewer_Name = names[1:25],
    Content_Review = content_reviews[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Reviews = reviews[1:25]
  )
}

bat_urls<-c('https://www.imdb.com/title/tt0468569/reviews/?ref_=tt_ov_rt',
            'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrrrxq42ar23umdt7xkalbpswt5pjt6udcsoeyfxmrib4d4ib5rovrucjv2d2uumrg5wjeyi',
            'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbyrhsmycb43ikdz77jb3epuvd5pjt6ud26oq4fjnzcb4dyc6ppmxry5zkrxu2l7fbtngszk',
            'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbxr3q4sbj63imt57pob3c7eu35pjt6ud23payfjprnb4d4djuyfc7ekcljqw6vwqcduinns',
            'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbvqlsmyaz23uotx4hoapdp2u35pjt6ud23oayvrmzib4dqhlhzziogtmgedvvutw2wjfhlo',
            'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbsr7qmucjz34kd36xeb3apuud5pjt6ucc2ou2vlprlb4d3sbkg4fzlbfs5l6l7tbpjevudw',
            'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbtr3u4qart2iodd6hia7a7qvd5pjt6udcspeyfvnrib4drbbrbomrxlxoe2lmpu7ki26y4o',
            'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbqrtu42bby3iot34hlalc7ytttfjrkybc7oq2fvpzyocsza67ff4idd7bglkt3hkqeagaq',
            'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbrrttmoazy3yodx6pnalep4ud5pjt6udcsoiyv3mzkb4dxroedj2rzwxx3vynqylqqnisc2',
            'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjyqlsmmajs2mmtr6pmald7sw3coq366sszoazv7pzkd54k5ibqhrcc4ydbmvbv7jlj2nypg4i',
            'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjyrpr4saj53yptz4heatc7gwthoq366ss6oq4f3nrld54k5hbb5pcgfj6mpj75meedcwgz6da',
            'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjzr7u44bz534md567ja3d7wtttfjrkudc3oqyfzmjyodowchrjtt5v22n7jggm4ms5oxpq'
)

Bm_reviews <- lapply(bat_urls, Batman_reviews)
The_Dark_Night_Review <- do.call(rbind, Bm_reviews)
View(The_Dark_Night_Review)


#8th Movie

session <- bow(url = 'https://www.imdb.com/title/tt0944947/reviews/?ref_=tt_ov_rt', user_agent = "Educational")

session

session_scrape <- scrape(session)

GoT_reviews <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  GoT_df= data.frame(
    Movie_Name=c('Game of Thrones'),
    Reviewer_Name = names[1:25],
    Content_Review = content_reviews[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Reviews = reviews[1:25]
  )
}

GoT_urls<-c('https://www.imdb.com/title/tt0944947/reviews/?ref_=tt_ov_rt',
            'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrzrhsmyab534mtb4ppatepqtttfjrkqcssou2fvnzyocspfcj3jheua3t264iscxfvnhsq',
            'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrsr7umubzs3mmd37xfa7dpuwt5pjt6ucktomzf3mbib4dzoabtkgp4lrpc7rvgwsvb3sm5u',
            'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrqrpumqab43mptb4heb7apev35pjt6ucc5oayflmzcb4d7ht6gkdjwvqbmn6pmsuzjnmc6g',
            'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzyrtsmybjs34kdv7pnaxb74vt5pjt6ucktoy4frmbmb4d345772c4vpr6ixch6ucxlw7lp6',
            'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzzrht4ybz73umtd67fahbpyvl5pjt6ucctoe3vlpzob4d5mjl3gyljwdg2opp6vt7gklli6',
            'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzwrdrmmaz534pd74ppale72vt5pjt6ucs6oa2vxnbjb4d44ijxosrcamigcbwcjbfsvi4zs',
            'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzxrdsmyars2mntd7hjb3bpgvl5pjt6uc24ou3f3pzmb4d3hkibx5wqoooyco7h3r426jyxi',
            'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzur3tmuab23ypd37xnahb76u35pjt6ucc5oy4fjmzib4dxwpuag24fiwbswyos5a5itwfwa',
            'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzvrtrm6azt3imdv7xkalb72vd5pjt6ucc4o44f5mzpb4d5jjrctb3qpww6amw23ldkiq2de',
            'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzsr7tmocb43untd7pfa7dp6vl5pjt6uckzo43fvnbpb4dvmltt5bvexgojnaahbl4vwr2a2',
            'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzsrpr4qaj23qmtv6pfa3epuud5pjt6ucctoe4fzmzmb4duwhb5z65mfdixaricpw7dshysg'
)

GOT_reviews <- lapply(GoT_urls, GoT_reviews)
Game_Of_Thrones_Review <- do.call(rbind, GOT_reviews)
View(Game_Of_Thrones_Review)

#9th Movie

session <- bow(url = 'https://www.imdb.com/title/tt0133093/reviews/?ref_=tt_ov_rt', user_agent = "Educational")

session

session_scrape <- scrape(session)

TheMAT_reviews <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  TheMat_df= data.frame(
    Movie_Name=c('The Matrix'),
    Reviewer_Name = names[1:25],
    Content_Review = content_reviews[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Reviews = reviews[1:25]
  )
}

TheMat_urls<-c('https://www.imdb.com/title/tt0133093/reviews/?ref_=tt_ov_rt',
               'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnrrr3u4ybby3ykdx67oadapuud5pjt6uck4ou2vjnzob4dqz7che2hhz4tautvqvbmmkclv6',
               'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzqqpq4wcj63yptr4pia7a7gu35pjt6ud23oq2f3nrcb4d3bchtq62u3bcydtu22ab27gcj2',
               'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbwrlqmycjs2mptv7hiadc7wtttfjrkwbkzom3flmbyoclejzon7xfjqe6uk4l656a76ciq',
               'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbtrtumyab63qmd57poa7bpeu35pjt6uc25om4v7mzjb4d7kplmearkfukzq2bbsi7fc2wpw',
               'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjzrhs4sab734pd37plahe7qvl5pjt6udk6oeyv3mzmb4due2i7t32wptqr3n2rbrqmqw6g4',
               'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjur7smuar52imtx6pib3c72w3coq366ss4oyzv5pzpcv4k4c7pwcex6ush2sz6iqvnsujtila',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjvr7qmybj73mmtv7hfapdpqvdcoq366ss3ouyvjmjicr4k5fjezd3dozlrjt322s4shtf3dcy',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjsqpu4oazz3qotx7xma3epwulhoq366ss6pezv5nzpdj4k4d3vchhyqthohppiexzzppkvtmq',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjsrprmsbby2int77pjaxe76vt5pjt6udk6oa4fvprob4d5gloaztzx3by3kc575pnylbydw',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjtrhs46cby2mkd57xea3epwwtfoq366sstoy3f3mjpdz4k473ib4ocvjz735lvzyykykstnzy',
               'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjqr7smwab43qmdv4pmb7dpqtttfjrkwdc4oy3vtpryoc55ic2cdutletk7hso3aoudb6ea'
)

Mat_reviews <- lapply(TheMat_urls, TheMAT_reviews)
The_Matrix_Review <- do.call(rbind, Mat_reviews)
View(The_Matrix_Review)


#10th Movie 

session <- bow(url = 'https://www.imdb.com/title/tt7286456/reviews/?ref_=tt_ov_rt', user_agent = "Educational")

session

session_scrape <- scrape(session)

J_reviews <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  J_df= data.frame(
    Movie_Name=c('Joker'),
    Reviewer_Name = names[1:25],
    Content_Review = content_reviews[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Reviews = reviews[1:25]
  )
}

Joker_urls<-c('https://www.imdb.com/title/tt7286456/reviews/?ref_=tt_ov_rt',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4xojermtizcsyab7gthhnjyr3rmscb334ptt6xqcwb32v3anyqkqdc2mjoiowpydsvm4fi7sco74xhznfze2',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4u6dermtizcsyql7svxtnbwrhummbjy2indd7xqcwb32v3dnuqk6cc3mjoe6wgcaa5rotrhloieackcmln4a',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4v6jermtizcsyqe72th7nzsr7q4oab23ukd34hqcwb32w3cneqk4dc4mjojn436emy2qykz2dpia2cnnllvo',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4s6rermtizcsyqg7kxxhmbzr3qmwaj23indd7hqcwb32v3anywkkdstmjoe4ftogfnfuqqj4fmi5jhloxp7q',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6hcbsqyxdo6ih7svxfmzyqlq4uabz3uodb7xndpj3qflemawkybksourtbfril4q2kokts6qinqoycoiynhi',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6lbjsqyxdo6ih7suxvmzyr7t4ucby3ektt6xldpj3qflhnyr2kcc2oertbvbpq7drbsislm2eayc5wxkuqdi',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ncbsqyxdo6ih7wth5mjtr7rmubr53qndb6hedpj3qflenmt26dczoirtbyw4mavzbuzm6heuv4gkcye7say',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6rbjsqyxdo6ih7wuhvnzwqpumwbbt3akdr77jdpj3qfleniw2ud27o4rtb5xnfbaz3qpcwf2yqz3iczovdoa',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4xohcbsqyxdo6ih7wvxhmzsrdqmubb334nt74ppdpj3qflenqrkscc2oertbiu7vtbhl7yf7vwjcamq6eezq2i',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4xolbjsqyxdo6ih7wwxhobvrhrm6bzy3qotr6pjdpj3qflenawkqbk2oartax3qkeddfun23ascdzugufa4s3q',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4xoncbsqyxdo6ih7wxxxmbqr3umuar234ktb6pfdpj3qfleniqkkdszpertbnlp2ec2caasbomrlicogvlmr6y'
)

Joker_reviews <- lapply(Joker_urls, J_reviews)
Joker_Review <- do.call(rbind, Joker_reviews)
View(Joker_Review)

Movie_Reviews_3000 <- rbind ( TheMeg2_Review , Saltburn_Review , Spiderman_Review , Puss_N_Boots_Review,  Dune_Review ,Interstellar_Review, The_Dark_Night_Review ,  Game_Of_Thrones_Review,  The_Matrix_Review, Joker_Review)

View(Movie_Reviews_3000)



csv_file <- "Movie_Reviews_3000.csv"
write.csv(Movie_Reviews_3000, file = csv_file)
HouseholdData <- read.csv("Movie_Reviews_3000.csv")


