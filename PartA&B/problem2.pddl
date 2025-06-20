(define (problem windfarm-mission-2)
    (:domain windfarm)

    (:objects
        uuv1 - uuv ; the uuv
        WP1 WP2 WP3 WP4 WP5 - location ; 5 locations
        )

    (:init
        (uuvAtShip uuv1) ; uuv at ship
        (emp uuv1) ; empty space
        ; Connections 
        (connected WP1 WP2) ;WP1->WP2
        (connected WP1 WP4) ;WP1->WP4
        (connected WP2 WP3) ;WP2->WP3
        (connected WP4 WP3) ;WP4->WP3
        (connected WP3 WP5) ;WP3->WP5
        (connected WP5 WP1) ;WP5->WP1
    )

    (:goal
        (and
            (captured-image WP5) ; capture image at WP5
            (captured-sonar WP3) ; capture sonar at WP3
            (sample-collected WP1) ; collect sample from WP1
            (uuvAtShip uuv1) ; return to ship
            (deployed uuv1) ; deployed
            (not (memory-full uuv1)) ; memory is empty
        )
    )
)