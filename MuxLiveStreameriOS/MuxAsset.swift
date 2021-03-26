//
//  MuxAsset.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/26/21.
//

import UIKit

// MARK: - MuxAsset
/// Get Asset Docs
/// https://docs.mux.com/api-reference/video#operation/get-asset
struct MuxAsset: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let tracks: [Track]
    let status: String
    let playbackIDS: [PlaybackID]
    let mp4Support: String
    let maxStoredResolution: String
    let maxStoredFrameRate: Double
    let masterAccess: String
    let id: String
    let duration: Double
    let createdAt: String
    let aspectRatio: String

    enum CodingKeys: String, CodingKey {
        case tracks, status
        case playbackIDS = "playback_ids"
        case mp4Support = "mp4_support"
        case maxStoredResolution = "max_stored_resolution"
        case maxStoredFrameRate = "max_stored_frame_rate"
        case masterAccess = "master_access"
        case id, duration
        case createdAt = "created_at"
        case aspectRatio = "aspect_ratio"
    }
}

// MARK: - PlaybackID
struct PlaybackID: Codable {
    let policy, id: String
}

// MARK: - Track
struct Track: Codable {
    let type: String
    let maxWidth: Int?
    let maxHeight: Int?

    var maxSize: CGSize? {
        guard let width: Int = maxWidth,
              let height: Int = maxHeight else { return nil }
        return CGSize(width: width, height: height)
    }
    let maxFrameRate: Double?
    let id: String
    let duration: Double
    let maxChannels: Int?
    let maxChannelLayout: String?

    enum CodingKeys: String, CodingKey {
        case type
        case maxWidth = "max_width"
        case maxHeight = "max_height"
        case maxFrameRate = "max_frame_rate"
        case id, duration
        case maxChannels = "max_channels"
        case maxChannelLayout = "max_channel_layout"
    }
}
