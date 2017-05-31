//
//  TeamData.swift
//  NBA Teams
//
//  Created by Wismin Effendi on 5/31/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import Foundation


struct NBATeam {
    
    static var easternConference: [Team] = [
        Team(name: "Atlanta Hawks", location: "Atlanta, Georgia", conference: .eastern),
        Team(name: "Boston Celtics", location: "Boston, Massachusetts", conference: .eastern),
        Team(name: "Brooklyn Nets", location: "Brooklyn, New York", conference: .eastern),
        Team(name: "Charlotte Hornets", location: "Charlotte, North Caroline", conference: .eastern),
        Team(name: "Chicago Bulls", location: "Chicago, Illinois", conference: .eastern),
        Team(name: "Cleveland Cavaliers", location: "Cleveland, Ohio", conference: .eastern),
        Team(name: "Detroit Pistons", location: "Detroit, Michigan", conference: .eastern),
        Team(name: "Indiana Pacers", location: "Indianapolis, Indiana", conference: .eastern),
        Team(name: "Miami Heat", location: "Miami, Florida", conference: .eastern),
        Team(name: "Milwaukee Bucks", location: "Milwaukee, Wisconsin", conference: .eastern),
        Team(name: "New York Knicks", location: "Manhattan, New York", conference: .eastern),
        Team(name: "Orlando Magic", location: "Orlando, Florida", conference: .eastern),
        Team(name: "Philadelphia", location: "Philadelphia, Pennsylvania", conference: .eastern),
        Team(name: "Toronto Raptors", location: "Toronto, Ontario, Canada", conference: .eastern),
        Team(name: "Washington Wizards", location: "Washington DC", conference: .eastern)
    ]
    
    static var westernConference: [Team] = [
        Team(name: "Dallas Mavericks", location: "Dallas, Texas", conference: .western),
        Team(name: "Denver Nuggets", location: "Denver, Colorado", conference: .western),
        Team(name: "Golden State Warriors", location: "Oakland San Francisco, California", conference: .western),
        Team(name: "Houston Rockets", location: "Houston, Texas", conference: .western),
        Team(name: "Los Angeles Clippers", location: "Los Angeles, California", conference: .western),
        Team(name: "Los Angeles Lakers", location: "Los Angeles, California", conference: .western),
        Team(name: "Memphis Grizzlies", location: "Memphis, Tenessee ", conference: .western),
        Team(name: "Minnesota Timberwolves", location: "Minneapolis", conference: .western),
        Team(name: "New Orleans Pelicans", location: "New Orleans", conference: .western),
        Team(name: "Oklahoma City Thunder", location: "Oklahoma City", conference: .western),
        Team(name: "Phoenix Suns", location: "Phoenix, Arizona", conference: .western),
        Team(name: "Portland Trail Blazers", location: "Portland, Oregon", conference: .western),
        Team(name: "Sacramento Kings", location: "Sacramento, California", conference: .western),
        Team(name: "San Antonio Spurs", location: "San Antonio, Texas", conference: .western),
        Team(name: "Utah Jazz", location: "Salt Lake City, Utah", conference: .western),
    ]
}

