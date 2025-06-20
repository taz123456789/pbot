

(define (problem windfarm-mission-3)
    (:domain windfarm)

    (:objects
        uuv1 uuv2 - uuv ; we have 2 uuvs
        WP1 WP2 WP3 WP4 WP5 WP6 - location ; 6 locations
        )

    (:init
        (uuvAtShip uuv1) ; uuv1 at ship
        (uuvAtShip uuv2) ; uuv2 at ship
        (emp uuv1) ; empty space for sample in uuv1
        (emp uuv2) ; empty space for sample in uuv2
        ; Connections 
        (connected WP1 WP2) ; WP1 -> WP2
        (connected WP2 WP1) ; WP2 -> WP1
        (connected WP2 WP4) ; WP2 -> WP4
        (connected WP2 WP3) ; WP2 -> WP3
        (connected WP4 WP2) ; WP4 -> WP2
        (connected WP3 WP5) ; WP3 -> WP5
        (connected WP5 WP3) ; WP5 -> WP3
        (connected WP5 WP6) ; WP5 -> WP6
        (connected WP6 WP4) ; WP6 -> WP4
    )

    (:goal
        (and
            (captured-image WP3) ; Save an image at WP3
            (captured-sonar WP4) ; Save a sonar scan at WP4
            (captured-image WP2) ; Save an image at WP2
            (captured-sonar WP6) ; Save a sonar scan at WP6
            (sample-collected WP5) ; Collect a sample from WP5
            (sample-collected WP1) ; Collect a sample from WP1
            (uuvAtShip uuv1) ; return to ship
            (uuvAtShip uuv2) ; return to ship
            (deployed uuv1) ; uuv1 is deployed
            (deployed uuv2) ; uuv2 is deployed
            (not (memory-full uuv1)) ; memory is empty in uuv1
            (not (memory-full uuv2)) ; memory is empty in uuv2
        )
    )
)