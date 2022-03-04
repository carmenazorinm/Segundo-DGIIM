
#encoding : UTF−8
module Basico
    module ColorPelo
        MORENO= :moreno
        CASTAÑO= :castaño
        RUBIO= :rubio
        PELIROJO= :pelirrojo
    end

    class Persona
        def initialize ( n , e , p ) # " c o n st r u ct o r "
            # A t r i b u t o s de i n s t a n c i a ( son p r i v a d o s )
            @nombre=n
            @edad=e
            @pelo=p
        end

        public # aunque l o s métodos son pú b l i c o s po r d ef e ct o
        def saluda # Método pú b l i c o de i n s t a n c i a
            puts " Hola , soy "+@nombre
        end
    end

    p=Persona.new("Pepe",10,ColorPelo::RUBIO)
    p.saluda
end