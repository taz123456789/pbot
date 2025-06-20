(define (problem windfarm-mission)
    (:domain windfarm)
    (:objects
        uuv1 - uuv ;UUV
        WP1 WP2 WP3 WP4 - location ;4 location
        )
    (:init
        (emp uuv1) ; uuv has empty space
        (uuvAtShip uuv1) ; uuv at ship
        ; Connections
        (connected WP1 WP2) ; WP1 -> WP2
        (connected WP2 WP1) ; WP2 -> WP1
        (connected WP2 WP3) ; WP2 -> WP3
        (connected WP3 WP4) ; WP3 -> WP4
        (connected WP4 WP3) ; WP4 -> WP3
        (connected WP4 WP1) ; WP4 -> WP1
    )

    (:goal
        (and
            (captured-image WP3) ; capture image in location WP3
            (captured-sonar WP4) ; capture  sonar scan in location WP4
            (uuvAtShip uuv1) ; return to ship
            (deployed uuv1)
            (not (memory-full uuv1)) ; memory is empty
        )
    )
)