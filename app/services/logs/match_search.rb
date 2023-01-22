class Logs::MatchSearch
    def initialize(term)
      @term = term
    end
  
    def call
        { 
            query: {
                match: {}.merge!(@term)
            }

        }
    end
  
    private
    
    attr_reader :term
end