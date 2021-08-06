package linksharingdomain

import grails.gorm.transactions.Transactional

@Transactional
class TopPostService {

    def serviceMethod() {

    }
    def topPost(){
        List<ResourceRating> l = ResourceRating.createCriteria().list{
            projections{
                avg("score");
            }
            groupProperty("resource");
        }
        Map resourceRating= [:]
        println "post--->>>"+l
        l.each{
            resourceRating.put(it[1],it[0]);
        }
        println "maptopPost---->>>> "+resourceRating
        resourceRating.sort{it.value};
        List<Resource> toppost = [];
        resourceRating.each{
            toppost.push(it.key);
        }
        List<Resource>revtoppost = toppost.reverse();
        List<Resource> result = []
        for(int i=0;i<Math.min(toppost.size(),5);i++){
            result.push(revtoppost.get(i));
        }
        println "toppost----->>> "+result;
        return result;

        }

    }

