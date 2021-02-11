//
//  Project.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import UIKit

struct Project: Codable, Identifiable {
    let id: UUID
    var date: Date
    var title: String
    var description: String
    var header: Data?
    
    var headerImage: UIImage? {
        guard let data = header else {
            return nil
        }
        
        return UIImage(data: data)
    }
    
    var headerColor: UIColor? {
        guard let data = header,
           let colorString = String(data: data, encoding: .utf8),
           let projectColor = ProjectColor(rawValue: colorString) else {
            return nil
        }
        
        return projectColor.colorRepresentation
    }
}

extension Project {
    init(id: UUID, date: Date, title: String, description: String, header: UIImage) {
        self.id = id
        self.date = date
        self.title = title
        self.description = description
        self.header = header.jpegData(compressionQuality: 1)
    }
}

extension Project {
    init(id: UUID, date: Date, title: String, description: String, header: ProjectColor) {
        self.id = id
        self.date = date
        self.title = title
        self.description = description
        self.header = header.rawValue.data(using: .utf8)
    }
}
