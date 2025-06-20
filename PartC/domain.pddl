(define (domain windfarm)
    (:requirements :negative-preconditions :typing)
    (:types
        uuv location engineer
    )
    (:predicates
        (at ?u - uuv ?l - location) ; position of uuv
        (uuvAtShip ?u - uuv) ;uuv is at ship
        (connected ?l1 - location ?l2 - location) ; Connection between locations
        (captured-image ?l - location) ; uuv has captured an image at a location
        (captured-sonar ?l - location) ; uuv has captured sonar data at a location
        (memory-full ?u - uuv)
        (deployed ?u - uuv) ; uuv has been deployed
        (emp ?u - uuv); empty space
        (sample-collected ?l - location) ; sample is collected in that location 
        (engineer-in-bay ?u - uuv) ; ingeneer is in bay
    )

    (:action deploy ;deploy uuv
        :parameters (?u - uuv ?l - location)
        :precondition (and (not (deployed ?u))(engineer-in-bay ?u) (uuvAtShip ?u))
        :effect (and (at ?u ?l) (deployed ?u) (not (uuvAtShip ?u)))
    )

    (:action move ; move uuv from 1 location to another
        :parameters (?u - uuv ?from - location ?to - location)
        :precondition (and (at ?u ?from) (not (uuvAtShip ?u)) (connected ?from ?to) (deployed ?u))
        :effect (and (at ?u ?to) (not (at ?u ?from)))
    )

    (:action capture-image ; capture image 
        :parameters (?u - uuv ?l - location)
        :precondition (and (at ?u ?l) (not (captured-image ?l)) (deployed ?u)
            (not (engineer-in-bay ?u)) (not (memory-full ?u)))
        :effect (and (captured-image ?l) (memory-full ?u))
    )

    (:action capture-sonar ; capture sonar
        :parameters (?u - uuv ?l - location)
        :precondition (and (at ?u ?l) (not (captured-sonar ?l)) (deployed ?u)
            (not (engineer-in-bay ?u)) (not (memory-full ?u)))
        :effect (and (captured-sonar ?l) (memory-full ?u))
    )
    (:action engineer-bay ;engineer is moved to bay
        :parameters (?u - uuv)
        :precondition (not(engineer-in-bay ?u))
        :effect (engineer-in-bay ?u)
    )
    (:action engineer-control ; engineer is moved to control
        :parameters (?u - uuv)
        :precondition (engineer-in-bay ?u)
        :effect (not (engineer-in-bay ?u))
    )
    (:action upload-image-or-sonar ; uploading image when memory is full
        :parameters (?u - uuv)
        :precondition (and (memory-full ?u) (not (engineer-in-bay ?u)))
        :effect (not (memory-full ?u)) ;
    )

    (:action collect-sample ; collecting sample in that location
        :parameters (?u - uuv ?l - location)
        :precondition (and (at ?u ?l) (not (sample-collected ?l)) (emp ?u)(deployed ?u))
        :effect (and (sample-collected ?l) (not(emp ?u)))
    )

    (:action return-to-ship ; uuv return to ship
        :parameters (?u - uuv ?l - location)
        :precondition (and (at ?u ?l) (not (uuvAtShip ?u))(engineer-in-bay ?u) (deployed ?u))
        :effect (and (uuvAtShip ?u) (not (at ?u ?l)))
    )
)