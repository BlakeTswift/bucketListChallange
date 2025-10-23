//
//  ContentView.swift
//  bucketListChallange
//
//  Created by Trytten, Blake - Student on 10/21/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    let Paris = CLLocationCoordinate2D(latitude: 48.864716, longitude: 2.349014)
    let Tower = CLLocationCoordinate2D(latitude:     48.8584, longitude: 2.294488)
    
    let Museum = CLLocationCoordinate2D(latitude:     48.8606, longitude: 2.3376)
    
    let Cathedral = CLLocationCoordinate2D(latitude:     48.8530, longitude: 2.3499)
    
    let Basilica = CLLocationCoordinate2D(latitude:     48.8868, longitude: 2.3431)
    
    @State var camera: MapCameraPosition = .automatic
    
    @State var showMoreInfo = false
    
    @State var description: String = ""
    
    @State var link: String = "https://www.google.com"
    var body: some View {
        ZStack {
            Map(position: $camera) {
                Marker("Paris Center",systemImage: "", coordinate: Paris)
                
                Marker("Eiffel Tower",systemImage: "camera.fill", coordinate: Tower)
                    .tint (.yellow)
                
                Marker("Louvre Museum",systemImage: "camera.fill", coordinate: Museum)
                    .tint (.yellow)
                
                Marker("Notre-Dame Cathedral",systemImage: "figure.walk", coordinate: Cathedral)
                    .tint (.green)
                
                Marker("Sacré-Cœur Basilica",systemImage: "figure.walk", coordinate: Basilica)
                    .tint (.green)
                
                
            }
           
            //change to true
            if showMoreInfo == true {
                VStack {
                    
                        VStack{
                            Text("Paris")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundStyle(.white)
                                .offset(y: -70)
                                .frame (width: 100, height: 20)
                            Text(description)
                                .fontWeight(.light)
                                .foregroundStyle(.white)
                                .font(.caption)
                                .offset(y: -70)
                            
                            Link(destination: URL(string: link)!) {
                                Image(systemName: "info.circle.text.page.fill")
                                    .foregroundStyle(.white)
                                    .padding(.top)
                                    .font(.system(size: 40))
                            
                        }
                        
                    }
                                .frame(width: 125, height: 300)
                                .background(Color.blue)
                                .offset(x:140,y:-200)
                    
                }
            }
            HStack {
                VStack {
                    Button {camera = .region(MKCoordinateRegion(center: Paris, latitudinalMeters: 100, longitudinalMeters: 100))
                        showMoreInfo = true
                        description = "This is The center of Paris known as the 'Centre Pompidou"
                        link = "https://parispass.com/en/things-to-do/things-to-do-paris-city-centre"
                    }
                    
                    label: {
                        Text("Paris Center")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .padding(5)
                            .background(Color.red)
                            
                    }
                    Button {camera = .region(MKCoordinateRegion(center: Paris, latitudinalMeters: 100, longitudinalMeters: 100))
                        showMoreInfo = true
                        description = "This is the Famous Eiffle tower A super tall and famous tower that is a staple of Paris"
                        link = "https://www.toureiffel.paris/en"
                        
                    } label: {
                        Text("Eiffel Tower")
                            .font(.caption)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .padding(5)
                            .background(Color.red)
                            .frame(height: 70)
                        Button {camera = .region(MKCoordinateRegion(center: Paris, latitudinalMeters: 100, longitudinalMeters: 100))
                            showMoreInfo = true
                            description = "This museum is known for its vast collection of art and artifacts relating to france and art history"
                            link = "https://www.tripadvisor.com/Attraction_Review-g187147-d188757-Reviews-Louvre_Museum-Paris_Ile_de_France.html"
                        } label: {
                            Text("Louvre Museum")
                                .font(.caption)
                                .fontWeight(.heavy)
                                .foregroundStyle(.white)
                                .padding(5)
                                .background(Color.red)
                                .frame(height: 70)
                            Button {camera = .region(MKCoordinateRegion(center: Paris, latitudinalMeters: 100, longitudinalMeters: 100))
                                showMoreInfo = true
                                description = "The Notre Dame Cathedral is a catholic cathedral located in the heart of Paris and is loved by many locals"
                                link = "https://www.notredamedeparis.fr/en/"
                            } label: {
                                Text("Notre-Dame Cathedral")
                                    .font(.caption)
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.white)
                                    .padding(5)
                                    .background(Color.red)
                                    .frame(height: 70)
                                Button {camera = .region(MKCoordinateRegion(center: Paris, latitudinalMeters: 100, longitudinalMeters: 100))
                                    description = "The Sacré-Cœur Basilica is a catholic basilica located in on the map and is known for its stunning views along with its beautiful architecture"
                                    link = "https://www.sacre-coeur-montmartre.com/en/"
                                    showMoreInfo = true
                                } label: {
                                    Text("Sacré-Cœur Basilica")
                                        .font(.caption)
                                        .fontWeight(.heavy)
                                        .foregroundStyle(.white)
                                        .padding(5)
                                        .background(Color.red)
                                        .frame(height: 70)
                                }
                                
                                
                            }
                        }
                    }
                }
            }
            .offset(y: 370)
        }
    }
}

#Preview {
    ContentView()
}
