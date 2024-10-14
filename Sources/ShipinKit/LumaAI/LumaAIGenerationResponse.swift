//
//  LumaAIGenerationResponse.swift
//  ShipinKit
//
//  Created by Rudrank Riyam on 10/13/24.
//

import Foundation
/// Represents the response from the Luma AI generation API.
///
/// This struct encapsulates the data returned by the Luma AI generation API, including
/// information about the generation process, its current state, and associated assets.
public struct LumaAIGenerationResponse: Codable, Sendable {
  /// A Boolean value indicating whether there are more results available.
  public let hasMore: Bool?
  
  /// The total count of generations in the response.
  public let count: Int
  
  /// The maximum number of generations that can be returned in a single response.
  public let limit: Int
  
  /// The number of generations skipped before the current set of results.
  public let offset: Int
  
  /// An array of generation details.
  public let generations: [LumaAIGeneration]
  
  /// Represents a single generation in the response.
  public struct LumaAIGeneration: Codable, Sendable {
    /// The unique identifier for the generation.
    public let id: String
    
    /// The current state of the generation (e.g., "completed", "failed", "in_progress").
    public let state: String
    
    /// The reason for failure, if the generation failed. Otherwise, it's null.
    public let failureReason: String?
    
    /// The timestamp when the generation was created.
    public let createdAt: String
    
    /// The assets associated with the generation.
    public let assets: LumaAIAssets
    
    /// The version of the Luma AI API used for this generation.
    public let version: String
    
    /// The original request parameters used for this generation.
    public let request: LumaAIGenerationRequest
  }
  
  enum CodingKeys: String, CodingKey {
    case hasMore = "has_more"
    case count
    case limit
    case offset
    case generations
  }
}

/// Contains the assets returned by the Luma AI generation API.
public struct LumaAIAssets: Codable, Sendable {
  public let video: String
}

/// Represents the original request sent to the Luma AI generation API.
public struct LumaAIGenerationRequest: Codable, Sendable {
  public let prompt: String
  public let aspectRatio: String
  public let loop: Bool
  public let keyframes: [String: LumaAIKeyframeData]
  public let callbackURL: String?

  enum CodingKeys: String, CodingKey {
    case prompt
    case aspectRatio = "aspect_ratio"
    case loop
    case keyframes
    case callbackURL = "callback_url"
  }
}

/// Represents keyframe data in the generation request.
public struct LumaAIKeyframeData: Codable, Sendable {
  public let type: LumaAIKeyframeType
  public let url: String?
}

/// Represents the type of keyframe in the generation request.
public enum LumaAIKeyframeType: String, Codable, Sendable {
  case generation
  case image
}
