import 'package:flutter/material.dart';
import 'package:login_niche2/utils/flutterflow/flutter_flow_theme.dart';

class ReviewCard extends StatelessWidget {
  final String profileImageUrl;
  final String reviewerName;
  final String reviewDate;
  final String reviewTitle;
  final String reviewText;
  final double rating;

  const ReviewCard({
    Key? key,
    required this.profileImageUrl,
    required this.reviewerName,
    required this.reviewDate,
    required this.reviewTitle,
    required this.reviewText,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              spreadRadius: 2,
              blurRadius: 6,
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildReviewerInfo(context),
                  _buildReviewTitleAndRating(context),
                  _buildReviewText(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 

  Widget _buildReviewerInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Color(0x4C4B39EF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFF4B39EF),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    profileImageUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              reviewerName,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: Color(0xFF4B39EF),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Text(
            reviewDate,
            style: FlutterFlowTheme.of(context).labelSmall.override(
              fontFamily: 'Readex Pro',
              color: Color(0xFF57636C),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewTitleAndRating(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                reviewTitle,
                style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Outfit',
                  color: Color(0xFF14181B),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Text(
            rating.toString(),
            style: FlutterFlowTheme.of(context).titleMedium.override(
              fontFamily: 'Readex Pro',
              color: Color(0xFF39D2C0),
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          Icon(
            Icons.star_rounded,
            color: Color(0xFF39D2C0),
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildReviewText(BuildContext context) {
    return Text(
      reviewText,
      style: FlutterFlowTheme.of(context).labelMedium.override(
        fontFamily: 'Readex Pro',
        color: Color(0xFF57636C),
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}