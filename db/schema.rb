# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20151001124308) do

  create_table "abstract_requirement_functionality_annotations", :force => true do |t|
    t.integer "abstract_requirement_id"
    t.integer "functionality_id"
  end

  create_table "abstract_requirement_tool_assignments", :force => true do |t|
    t.integer "abstract_requirement_id"
    t.string  "tool_type"
    t.string  "tool_id"
  end

  create_table "abstract_requirement_translations", :force => true do |t|
    t.integer  "abstract_requirement_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "abstract_requirement_translations", ["abstract_requirement_id"], :name => "index_c6a4a0030c46588377d72cf71113ace3a9066eb5"
  add_index "abstract_requirement_translations", ["locale"], :name => "index_abstract_requirement_translations_on_locale"

  create_table "abstract_requirements", :force => true do |t|
    t.string  "name"
    t.string  "optionality"
    t.text    "description"
    t.integer "activity_id"
  end

  create_table "activities", :force => true do |t|
    t.string   "title"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.string   "timeToComplete"
    t.string   "interaction"
    t.boolean  "template"
    t.integer  "owner_id"
    t.integer  "creator_id"
    t.integer  "trace_id"
    t.integer  "trace_version"
    t.string   "status"
    t.integer  "position"
    t.integer  "activity_sequence_id"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.integer  "referenced_activity_id"
    t.string   "owner_type"
    t.text     "raw_html"
  end

  create_table "activities_requirements", :id => false, :force => true do |t|
    t.integer "activity_id"
    t.integer "requirement_id"
  end

  create_table "activity_instance_translations", :force => true do |t|
    t.integer  "activity_instance_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activity_instance_translations", ["activity_instance_id"], :name => "index_activity_instance_translations_on_activity_instance_id"
  add_index "activity_instance_translations", ["locale"], :name => "index_activity_instance_translations_on_locale"

  create_table "activity_instances", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "activity_id"
    t.integer "position"
    t.integer "activity_sequence_id"
  end

  create_table "activity_interaction_annotations", :force => true do |t|
    t.integer "activity_id"
    t.integer "interaction_id"
  end

  create_table "activity_learner_motivation_annotations", :force => true do |t|
    t.integer "activity_id"
    t.integer "learner_motivation_id"
  end

  create_table "activity_sequence_translations", :force => true do |t|
    t.integer  "activity_sequence_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activity_sequence_translations", ["activity_sequence_id"], :name => "index_activity_sequence_translations_on_activity_sequence_id"
  add_index "activity_sequence_translations", ["locale"], :name => "index_activity_sequence_translations_on_locale"

  create_table "activity_sequences", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "owner_id"
    t.integer  "creator_id"
    t.integer  "trace_id"
    t.integer  "trace_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.string   "owner_type"
  end

  create_table "activity_teacher_motivation_annotations", :force => true do |t|
    t.integer "activity_id"
    t.integer "teacher_motivation_id"
  end

  create_table "activity_technical_motivation_annotations", :force => true do |t|
    t.integer "activity_id"
    t.integer "technical_motivation_id"
  end

  create_table "activity_translations", :force => true do |t|
    t.integer  "activity_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "guidelinesPreparation"
    t.text     "guidelinesIntroduction"
    t.text     "guidelinesActivity"
    t.text     "guidelinesAssessment"
  end

  add_index "activity_translations", ["activity_id"], :name => "index_activity_translations_on_activity_id"
  add_index "activity_translations", ["locale"], :name => "index_activity_translations_on_locale"

  create_table "application_functionality_annotations", :force => true do |t|
    t.integer "application_id"
    t.integer "functionality_id"
    t.integer "level"
  end

  add_index "application_functionality_annotations", ["application_id"], :name => "index_application_functionality_annotations_on_application_id"

  create_table "application_operating_system_annotations", :force => true do |t|
    t.integer "application_id"
    t.integer "operating_system_id"
  end

  create_table "application_parent_categories", :force => true do |t|
    t.string "name"
  end

  create_table "application_translations", :force => true do |t|
    t.integer  "application_id"
    t.string   "locale"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "application_translations", ["application_id"], :name => "index_application_translations_on_application_id"
  add_index "application_translations", ["locale"], :name => "index_application_translations_on_locale"

  create_table "applications", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "itec_id"
    t.string   "ld_id"
    t.string   "external"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.integer  "owner_id"
    t.integer  "creator_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "owner_type"
    t.string   "hash_resource"
    t.string   "scraped_from"
    t.integer  "likes_in_alternative_to"
    t.text     "info_to_wikify"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.string   "slug"
  end

  add_index "applications", ["slug"], :name => "index_applications_on_slug", :unique => true

  create_table "article_subject_annotations", :force => true do |t|
    t.integer "article_id"
    t.integer "subject_id"
    t.float   "weight"
  end

  add_index "article_subject_annotations", ["article_id"], :name => "index_article_subject_annotations_on_article_id"

  create_table "article_translations", :force => true do |t|
    t.integer  "article_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_translations", ["article_id"], :name => "index_article_translations_on_article_id"
  add_index "article_translations", ["locale"], :name => "index_article_translations_on_locale"

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "scraped_from"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "hash_resource"
    t.text     "info_to_wikify"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.datetime "publication_date"
    t.string   "slug"
  end

  add_index "articles", ["slug"], :name => "index_articles_on_slug", :unique => true

  create_table "artwork_subject_annotations", :force => true do |t|
    t.integer "artwork_id"
    t.integer "subject_id"
    t.float   "weight"
  end

  add_index "artwork_subject_annotations", ["artwork_id"], :name => "index_artwork_subject_annotations_on_artwork_id"

  create_table "artwork_translations", :force => true do |t|
    t.integer  "artwork_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.text     "raw_html"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artwork_translations", ["artwork_id"], :name => "index_artwork_translations_on_artwork_id"
  add_index "artwork_translations", ["locale"], :name => "index_artwork_translations_on_locale"

  create_table "artworks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "scraped_from"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "hash_resource"
    t.text     "info_to_wikify"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.string   "author"
    t.string   "museum"
    t.string   "address"
    t.string   "slug"
  end

  add_index "artworks", ["slug"], :name => "index_artworks_on_slug", :unique => true

  create_table "biographies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "scraped_from"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "hash_resource"
    t.text     "info_to_wikify"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.string   "slug"
    t.text     "raw_html"
  end

  add_index "biographies", ["slug"], :name => "index_biographies_on_slug", :unique => true

  create_table "biography_subject_annotations", :force => true do |t|
    t.integer "biography_id"
    t.integer "subject_id"
    t.float   "weight"
  end

  add_index "biography_subject_annotations", ["biography_id"], :name => "index_biography_subject_annotations_on_biography_id"

  create_table "biography_translations", :force => true do |t|
    t.integer  "biography_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "raw_html"
  end

  add_index "biography_translations", ["biography_id"], :name => "index_biography_translations_on_biography_id"
  add_index "biography_translations", ["locale"], :name => "index_biography_translations_on_locale"

  create_table "blogs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "rss_feed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scraped_from"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "hash_resource"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
  end

  create_table "board_element_annotations", :force => true do |t|
    t.integer "board_id"
    t.string  "board_element_type"
    t.string  "board_element_id"
  end

  create_table "board_translations", :force => true do |t|
    t.integer  "board_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "board_translations", ["board_id"], :name => "index_board_translations_on_board_id"
  add_index "board_translations", ["locale"], :name => "index_board_translations_on_locale"

  create_table "boards", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.integer  "owner_id"
    t.integer  "creator_id"
  end

  create_table "book_subject_annotations", :force => true do |t|
    t.integer "book_id"
    t.integer "subject_id"
    t.float   "weight"
  end

  add_index "book_subject_annotations", ["book_id"], :name => "index_book_subject_annotations_on_book_id"

  create_table "book_translations", :force => true do |t|
    t.integer  "book_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.text     "raw_html"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "book_translations", ["book_id"], :name => "index_book_translations_on_book_id"
  add_index "book_translations", ["locale"], :name => "index_book_translations_on_locale"

  create_table "bookmark_user_element_annotations", :force => true do |t|
    t.integer "user_id"
    t.integer "element_id"
    t.string  "element_type"
  end

  add_index "bookmark_user_element_annotations", ["element_id", "element_type"], :name => "bookmark_element_index"
  add_index "bookmark_user_element_annotations", ["user_id"], :name => "index_bookmark_user_element_annotations_on_user_id"

  create_table "books", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "scraped_from"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "hash_resource"
    t.text     "info_to_wikify"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.string   "author"
    t.string   "slug"
  end

  add_index "books", ["slug"], :name => "index_books_on_slug", :unique => true

  create_table "boxes", :force => true do |t|
    t.integer "document_id"
    t.string  "document_type"
    t.string  "box_type"
    t.integer "position"
    t.integer "activity_id"
  end

  create_table "categories", :force => true do |t|
    t.string "name"
  end

  create_table "circumstances", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "has_internet"
    t.boolean  "has_interactive_whiteboard"
    t.integer  "subject_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "operating_system_id"
    t.integer  "educational_level_id"
    t.integer  "locale_id"
    t.text     "description"
  end

  create_table "clasificadores", :id => false, :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "classifiers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classroom_teacher_annotations", :force => true do |t|
    t.integer "classroom_id"
    t.integer "teacher_id"
  end

  create_table "classrooms", :force => true do |t|
    t.string "name"
  end

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components", :force => true do |t|
    t.integer  "box_id"
    t.string   "component_type"
    t.integer  "position"
    t.string   "area_image_file_name"
    t.string   "area_image_content_type"
    t.integer  "area_image_file_size"
    t.datetime "area_image_updated_at"
  end

  create_table "concrete_requirement_tool_annotations", :force => true do |t|
    t.integer "concrete_requirement_id"
    t.string  "tool_type"
    t.string  "tool_id"
  end

  create_table "concrete_requirement_tool_assignments", :force => true do |t|
    t.integer "concrete_requirement_id"
    t.string  "tool_type"
    t.string  "tool_id"
  end

  create_table "concrete_requirement_translations", :force => true do |t|
    t.integer  "concrete_requirement_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "concrete_requirement_translations", ["concrete_requirement_id"], :name => "index_b50fc6962fe65badea3524bcb5db09480b4447fa"
  add_index "concrete_requirement_translations", ["locale"], :name => "index_concrete_requirement_translations_on_locale"

  create_table "concrete_requirements", :force => true do |t|
    t.string  "name"
    t.string  "optionality"
    t.text    "description"
    t.integer "activity_id"
  end

  create_table "content_concrete_requirement_content_annotations", :force => true do |t|
    t.integer "content_concrete_requirement_id"
    t.integer "content_id"
  end

  create_table "content_concrete_requirement_content_assignments", :force => true do |t|
    t.integer "content_concrete_requirement_id"
    t.integer "content_id"
  end

  create_table "content_concrete_requirements", :force => true do |t|
    t.string  "name"
    t.string  "optionality"
    t.text    "description"
    t.integer "activity_id"
  end

  create_table "content_translations", :force => true do |t|
    t.integer  "content_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_translations", ["content_id"], :name => "index_content_translations_on_content_id"
  add_index "content_translations", ["locale"], :name => "index_content_translations_on_locale"

  create_table "contents", :force => true do |t|
    t.text     "curriculum_topic"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subject_id"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.integer  "owner_id"
    t.integer  "creator_id"
  end

  create_table "contextual_language_translations", :force => true do |t|
    t.integer  "contextual_language_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contextual_language_translations", ["contextual_language_id"], :name => "index_1be21e4ab41c8286cce138c4d96644c242be8229"
  add_index "contextual_language_translations", ["locale"], :name => "index_contextual_language_translations_on_locale"

  create_table "contextual_languages", :force => true do |t|
    t.string "name"
    t.string "sde_id"
  end

  create_table "contextual_setting_education_level_annotations", :force => true do |t|
    t.integer "contextual_setting_id"
    t.integer "education_level_id"
  end

  create_table "contextual_setting_language_annotations", :force => true do |t|
    t.integer "contextual_setting_id"
    t.integer "contextual_language_id"
  end

  create_table "contextual_setting_subject_annotations", :force => true do |t|
    t.integer "contextual_setting_id"
    t.integer "subject_id"
  end

  create_table "contextual_settings", :force => true do |t|
    t.string "name"
    t.text   "description"
    t.string "age_range"
    t.string "start_date"
    t.string "end_date"
    t.string "keywords"
    t.string "address"
    t.string "latitude"
    t.string "longitude"
    t.string "status"
  end

  create_table "contributor_requirement_person_assignments", :force => true do |t|
    t.integer "contributor_requirement_id"
    t.integer "person_id"
  end

  create_table "contributor_requirement_person_category_annotations", :force => true do |t|
    t.integer "contributor_requirement_id"
    t.integer "person_category_id"
  end

  create_table "contributor_requirement_person_role_annotations", :force => true do |t|
    t.integer "contributor_requirement_id"
    t.integer "person_role_id"
  end

  create_table "contributor_requirement_translations", :force => true do |t|
    t.integer  "contributor_requirement_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contributor_requirement_translations", ["contributor_requirement_id"], :name => "index_1750a8a37154d621d4896a8fde80080054201c82"
  add_index "contributor_requirement_translations", ["locale"], :name => "index_contributor_requirement_translations_on_locale"

  create_table "contributor_requirements", :force => true do |t|
    t.string  "name"
    t.string  "optionality"
    t.text    "description"
    t.integer "activity_id"
  end

  create_table "course_subject_annotations", :force => true do |t|
    t.integer "course_id"
    t.integer "subject_id"
    t.float   "weight"
  end

  add_index "course_subject_annotations", ["course_id"], :name => "index_course_subject_annotations_on_course_id"

  create_table "course_translations", :force => true do |t|
    t.integer  "course_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_translations", ["course_id"], :name => "index_course_translations_on_course_id"
  add_index "course_translations", ["locale"], :name => "index_course_translations_on_locale"

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "scraped_from"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.text     "info_to_wikify"
    t.string   "hash_resource"
    t.string   "slug"
  end

  add_index "courses", ["slug"], :name => "index_courses_on_slug", :unique => true

  create_table "dashboards", :force => true do |t|
    t.string  "name"
    t.integer "dashboard_owner_id"
    t.string  "dashboard_owner_type"
  end

  create_table "device_translations", :force => true do |t|
    t.integer  "device_id"
    t.string   "locale"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "device_translations", ["device_id"], :name => "index_device_translations_on_device_id"
  add_index "device_translations", ["locale"], :name => "index_device_translations_on_locale"

  create_table "devices", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "itec_id"
    t.string   "ld_id"
    t.string   "external"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.integer  "owner_id"
    t.integer  "creator_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "owner_type"
    t.string   "scraped_from"
  end

  create_table "documentaries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "scraped_from"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.text     "info_to_wikify"
    t.string   "hash_resource"
    t.string   "slug"
  end

  add_index "documentaries", ["slug"], :name => "index_documentaries_on_slug", :unique => true

  create_table "documentary_subject_annotations", :force => true do |t|
    t.integer "documentary_id"
    t.integer "subject_id"
    t.float   "weight"
  end

  add_index "documentary_subject_annotations", ["documentary_id"], :name => "index_documentary_subject_annotations_on_documentary_id"

  create_table "documentary_translations", :force => true do |t|
    t.integer  "documentary_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documentary_translations", ["documentary_id"], :name => "index_documentary_translations_on_documentary_id"
  add_index "documentary_translations", ["locale"], :name => "index_documentary_translations_on_locale"

  create_table "education_level_translations", :force => true do |t|
    t.integer  "education_level_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "education_level_translations", ["education_level_id"], :name => "index_education_level_translations_on_education_level_id"
  add_index "education_level_translations", ["locale"], :name => "index_education_level_translations_on_locale"

  create_table "education_levels", :force => true do |t|
    t.string "name"
    t.string "sde_id"
  end

  create_table "element_category_annotations", :force => true do |t|
    t.integer "categorizable_id"
    t.string  "categorizable_type"
    t.integer "category_id"
    t.float   "weight"
    t.string  "type_category"
  end

  create_table "eurovocs", :force => true do |t|
    t.integer "eurovoc_id"
    t.text    "name"
    t.integer "parent_id"
    t.string  "type_node"
    t.string  "ancestry"
  end

  create_table "event_concrete_requirement_event_annotations", :force => true do |t|
    t.integer "event_concrete_requirement_id"
    t.integer "event_id"
  end

  create_table "event_concrete_requirement_event_assignments", :force => true do |t|
    t.integer "event_concrete_requirement_id"
    t.integer "event_id"
  end

  create_table "event_concrete_requirements", :force => true do |t|
    t.string  "name"
    t.string  "optionality"
    t.text    "description"
    t.integer "activity_id"
  end

  create_table "event_places", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "event_requirement_event_assignments", :force => true do |t|
    t.integer "event_requirement_id"
    t.integer "event_id"
  end

  create_table "event_requirement_event_place_annotations", :force => true do |t|
    t.integer "event_requirement_id"
    t.integer "event_place_id"
  end

  create_table "event_requirement_event_type_annotations", :force => true do |t|
    t.integer "event_requirement_id"
    t.integer "event_type_id"
  end

  create_table "event_requirement_translations", :force => true do |t|
    t.integer  "event_requirement_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_requirement_translations", ["event_requirement_id"], :name => "index_event_requirement_translations_on_event_requirement_id"
  add_index "event_requirement_translations", ["locale"], :name => "index_event_requirement_translations_on_locale"

  create_table "event_requirements", :force => true do |t|
    t.string  "name"
    t.string  "optionality"
    t.text    "description"
    t.integer "activity_id"
  end

  create_table "event_subject_annotations", :force => true do |t|
    t.integer "event_id"
    t.integer "subject_id"
    t.float   "weight"
  end

  add_index "event_subject_annotations", ["event_id"], :name => "index_event_subject_annotations_on_event_id"

  create_table "event_translations", :force => true do |t|
    t.integer  "event_id"
    t.string   "locale"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "link"
  end

  add_index "event_translations", ["event_id"], :name => "index_event_translations_on_event_id"
  add_index "event_translations", ["locale"], :name => "index_event_translations_on_locale"

  create_table "event_types", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "age_range"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "address"
    t.integer  "education_level_id"
    t.integer  "contextual_language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.integer  "creator_id"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.string   "url"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "owner_type"
    t.string   "hash_resource"
    t.string   "itec_id"
    t.string   "scraped_from"
    t.string   "geohash_location"
    t.text     "info_to_wikify"
    t.string   "slug"
  end

  add_index "events", ["slug"], :name => "index_events_on_slug", :unique => true

  create_table "experience_step_contribution_annotations", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "position"
    t.integer "experience_step_id"
    t.integer "contribution_id"
    t.string  "contribution_type"
  end

  create_table "experience_steps", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "position"
    t.integer "experience_id"
  end

  create_table "experience_translations", :force => true do |t|
    t.integer  "experience_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experience_translations", ["experience_id"], :name => "index_experience_translations_on_experience_id"
  add_index "experience_translations", ["locale"], :name => "index_experience_translations_on_locale"

  create_table "experiences", :force => true do |t|
    t.integer  "guide_id"
    t.string   "name"
    t.text     "description"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.integer  "owner_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "owner_type"
  end

  create_table "free_texts", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "functionalities", :force => true do |t|
    t.string "name"
    t.text   "description"
    t.string "sde_id"
  end

  create_table "functionality_translations", :force => true do |t|
    t.integer  "functionality_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "functionality_translations", ["functionality_id"], :name => "index_functionality_translations_on_functionality_id"
  add_index "functionality_translations", ["locale"], :name => "index_functionality_translations_on_locale"

  create_table "globalizable_language_annotations", :force => true do |t|
    t.integer "globalizable_id"
    t.string  "globalizable_type"
    t.integer "language_id"
  end

  create_table "group_translations", :force => true do |t|
    t.integer  "group_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_translations", ["group_id"], :name => "index_group_translations_on_group_id"
  add_index "group_translations", ["locale"], :name => "index_group_translations_on_locale"

  create_table "group_user_annotations", :force => true do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.integer  "owner_id"
    t.integer  "creator_id"
    t.string   "owner_type"
  end

  create_table "guide_resource_annotations", :force => true do |t|
    t.integer "guide_id"
    t.integer "resource_id"
  end

  create_table "guide_translations", :force => true do |t|
    t.integer  "guide_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guide_translations", ["guide_id"], :name => "index_guide_translations_on_guide_id"
  add_index "guide_translations", ["locale"], :name => "index_guide_translations_on_locale"

  create_table "guideline_item_translations", :force => true do |t|
    t.integer  "guideline_item_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guideline_item_translations", ["guideline_item_id"], :name => "index_guideline_item_translations_on_guideline_item_id"
  add_index "guideline_item_translations", ["locale"], :name => "index_guideline_item_translations_on_locale"

  create_table "guideline_items", :force => true do |t|
    t.integer "guidelines_preparation_id"
    t.integer "guidelines_introduction_id"
    t.integer "guidelines_activity_id"
    t.integer "guidelines_assessment_id"
  end

  create_table "guides", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "activity_sequence_id"
    t.integer  "classroom_id"
    t.integer  "technological_setting_id"
    t.integer  "contextual_setting_id"
    t.integer  "owner_id"
    t.integer  "creator_id"
    t.integer  "trace_id"
    t.integer  "trace_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.string   "owner_type"
  end

  create_table "interaction_translations", :force => true do |t|
    t.integer  "interaction_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interaction_translations", ["interaction_id"], :name => "index_interaction_translations_on_interaction_id"
  add_index "interaction_translations", ["locale"], :name => "index_interaction_translations_on_locale"

  create_table "interactions", :force => true do |t|
  end

  create_table "klascement_subject_annotations", :force => true do |t|
    t.integer "klascement_id"
    t.integer "subject_id"
    t.float   "weight"
  end

  add_index "klascement_subject_annotations", ["klascement_id"], :name => "index_klascement_subject_annotations_on_klascement_id"

  create_table "klascement_translations", :force => true do |t|
    t.integer  "klascement_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.text     "raw_html"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "klascement_translations", ["klascement_id"], :name => "index_klascement_translations_on_klascement_id"
  add_index "klascement_translations", ["locale"], :name => "index_klascement_translations_on_locale"

  create_table "klascements", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "scraped_from"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "hash_resource"
    t.text     "info_to_wikify"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.string   "slug"
  end

  add_index "klascements", ["slug"], :name => "index_klascements_on_slug", :unique => true

  create_table "languages", :force => true do |t|
    t.string "language"
  end

  create_table "learner_motivation_translations", :force => true do |t|
    t.integer  "learner_motivation_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "learner_motivation_translations", ["learner_motivation_id"], :name => "index_learner_motivation_translations_on_learner_motivation_id"
  add_index "learner_motivation_translations", ["locale"], :name => "index_learner_motivation_translations_on_locale"

  create_table "learner_motivations", :force => true do |t|
    t.string "name"
  end

  create_table "lecture_subject_annotations", :force => true do |t|
    t.integer "lecture_id"
    t.integer "subject_id"
    t.float   "weight"
  end

  add_index "lecture_subject_annotations", ["lecture_id"], :name => "index_lecture_subject_annotations_on_lecture_id"

  create_table "lecture_translations", :force => true do |t|
    t.integer  "lecture_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "info_to_wikify"
  end

  add_index "lecture_translations", ["lecture_id"], :name => "index_lecture_translations_on_lecture_id"
  add_index "lecture_translations", ["locale"], :name => "index_lecture_translations_on_locale"

  create_table "lectures", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.string   "scraped_from"
    t.string   "url"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.text     "info_to_wikify"
    t.string   "hash_resource"
    t.string   "author"
    t.string   "slug"
  end

  add_index "lectures", ["slug"], :name => "index_lectures_on_slug", :unique => true

  create_table "levels", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "lre_subject_annotations", :force => true do |t|
    t.integer "lre_id"
    t.integer "subject_id"
    t.float   "weight"
  end

  add_index "lre_subject_annotations", ["lre_id"], :name => "index_lre_subject_annotations_on_lre_id"

  create_table "lre_translations", :force => true do |t|
    t.integer  "lre_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "raw_html"
  end

  add_index "lre_translations", ["locale"], :name => "index_lre_translations_on_locale"
  add_index "lre_translations", ["lre_id"], :name => "index_lre_translations_on_lre_id"

  create_table "lres", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "scraped_from"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "hash_resource"
    t.text     "info_to_wikify"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.text     "raw_html"
    t.string   "slug"
    t.boolean  "travel_well"
  end

  add_index "lres", ["slug"], :name => "index_lres_on_slug", :unique => true

  create_table "negative_comments", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "operating_systems", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "itec_id"
    t.string   "ld_id"
    t.integer  "owner_id"
    t.integer  "creator_id"
    t.string   "url"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mother_tongue_id"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "owner_type"
    t.string   "hash_resource"
    t.string   "scraped_from"
    t.text     "info_to_wikify"
    t.string   "area_of_expertise"
  end

  create_table "person_categories", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "person_concrete_requirement_person_annotations", :force => true do |t|
    t.integer "person_concrete_requirement_id"
    t.integer "person_id"
  end

  create_table "person_concrete_requirement_person_assignments", :force => true do |t|
    t.integer "person_concrete_requirement_id"
    t.integer "person_id"
  end

  create_table "person_concrete_requirements", :force => true do |t|
    t.string  "name"
    t.string  "optionality"
    t.text    "description"
    t.integer "activity_id"
  end

  create_table "person_language_annotations", :force => true do |t|
    t.integer "person_id"
    t.integer "contextual_language_id"
  end

  create_table "person_roles", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "person_subject_annotations", :force => true do |t|
    t.integer "person_id"
    t.integer "subject_id"
    t.integer "level"
  end

  create_table "person_translations", :force => true do |t|
    t.integer  "person_id"
    t.string   "locale"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_translations", ["locale"], :name => "index_person_translations_on_locale"
  add_index "person_translations", ["person_id"], :name => "index_person_translations_on_person_id"

  create_table "pictures", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "positive_comments", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "post_translations", :force => true do |t|
    t.integer  "post_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_translations", ["locale"], :name => "index_post_translations_on_locale"
  add_index "post_translations", ["post_id"], :name => "index_post_translations_on_post_id"

  create_table "posts", :force => true do |t|
    t.integer  "blog_id"
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hash_resource"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.text     "info_to_wikify"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "scraped_from"
    t.datetime "publication_date"
    t.string   "slug"
  end

  add_index "posts", ["slug"], :name => "index_posts_on_slug", :unique => true

  create_table "profiles", :force => true do |t|
    t.string  "name"
    t.integer "teacher_id"
  end

  create_table "reflexions", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "report_subject_annotations", :force => true do |t|
    t.integer "report_id"
    t.integer "subject_id"
    t.float   "weight"
  end

  add_index "report_subject_annotations", ["report_id"], :name => "index_report_subject_annotations_on_report_id"

  create_table "report_translations", :force => true do |t|
    t.integer  "report_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "report_translations", ["locale"], :name => "index_report_translations_on_locale"
  add_index "report_translations", ["report_id"], :name => "index_report_translations_on_report_id"

  create_table "reports", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "scraped_from"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "hash_resource"
    t.text     "info_to_wikify"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.datetime "publication_date"
    t.string   "slug"
    t.string   "section"
    t.text     "abstract"
    t.float    "wikify_threshold"
    t.float    "relatedness_threshold"
  end

  add_index "reports", ["slug"], :name => "index_reports_on_slug", :unique => true

  create_table "requirement_functionality_annotations", :force => true do |t|
    t.integer "requirement_id"
    t.integer "functionality_id"
  end

  create_table "requirement_level_annotations", :force => true do |t|
    t.integer "requirement_id"
    t.integer "level_id"
  end

  create_table "resources", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "reuters_new_items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "has_topics"
    t.string   "topics"
    t.string   "lewissplit"
    t.string   "cgisplit"
    t.integer  "old_id"
    t.integer  "new_id"
    t.string   "dateline"
    t.string   "places"
    t.string   "people"
    t.string   "orgs"
    t.string   "exchanges"
    t.string   "companies"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "info_to_wikify"
    t.string   "sde_split"
    t.string   "file_id"
    t.float    "wikify_threshold"
    t.float    "relatedness_threshold"
  end

  create_table "scenario_translations", :force => true do |t|
    t.integer  "scenario_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scenario_translations", ["locale"], :name => "index_scenario_translations_on_locale"
  add_index "scenario_translations", ["scenario_id"], :name => "index_scenario_translations_on_scenario_id"

  create_table "scenarios", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.boolean  "template"
  end

  create_table "scraping_statuses", :force => true do |t|
    t.integer "scrapeable_id"
    t.string  "scrapeable_type"
    t.boolean "automatically_tagged"
    t.boolean "categorized"
    t.boolean "translated"
    t.boolean "geolocalized"
    t.string  "geolocalized_by"
    t.boolean "translated_by_wikipedia"
  end

  create_table "site_translations", :force => true do |t|
    t.integer  "site_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_translations", ["locale"], :name => "index_site_translations_on_locale"
  add_index "site_translations", ["site_id"], :name => "index_site_translations_on_site_id"

  create_table "sites", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "scraped_from"
    t.string   "url"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.text     "info_to_wikify"
    t.string   "hash_resource"
    t.string   "slug"
  end

  add_index "sites", ["slug"], :name => "index_sites_on_slug", :unique => true

  create_table "slideshow_subject_annotations", :force => true do |t|
    t.integer "slideshow_id"
    t.integer "subject_id"
    t.float   "weight"
  end

  add_index "slideshow_subject_annotations", ["slideshow_id"], :name => "index_slideshow_subject_annotations_on_slideshow_id"

  create_table "slideshow_translations", :force => true do |t|
    t.integer  "slideshow_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slideshow_translations", ["locale"], :name => "index_slideshow_translations_on_locale"
  add_index "slideshow_translations", ["slideshow_id"], :name => "index_slideshow_translations_on_slideshow_id"

  create_table "slideshows", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "scraped_from"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "hash_resource"
    t.text     "info_to_wikify"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.string   "slug"
  end

  add_index "slideshows", ["slug"], :name => "index_slideshows_on_slug", :unique => true

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.text     "source_type"
    t.string   "url"
    t.text     "description"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "scraped_from"
    t.integer  "number_of_resources"
    t.datetime "last_scraping"
    t.datetime "last_tagged"
    t.datetime "last_categorize"
    t.datetime "last_geolocalize"
    t.boolean  "scraped_correct"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.boolean  "tagged_correct"
    t.boolean  "categorized_correct"
    t.boolean  "geolocalized_correct"
    t.string   "scrape_status"
  end

  create_table "step_requirement_resource_annotations", :force => true do |t|
    t.integer "activity_instance_id"
    t.string  "requirement_type"
    t.integer "requirement_id"
    t.string  "resource_type"
    t.integer "resource_id"
  end

  create_table "subject_translations", :force => true do |t|
    t.integer  "subject_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subject_translations", ["locale"], :name => "index_subject_translations_on_locale"
  add_index "subject_translations", ["subject_id"], :name => "index_subject_translations_on_subject_id"

  create_table "subjects", :force => true do |t|
    t.string "name"
    t.string "sde_id"
  end

  create_table "tag_translations", :force => true do |t|
    t.integer  "tag_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_translations", ["locale"], :name => "index_tag_translations_on_locale"
  add_index "tag_translations", ["tag_id"], :name => "index_tag_translations_on_tag_id"

  create_table "taggable_tag_annotations", :force => true do |t|
    t.integer "taggable_id"
    t.string  "taggable_type"
    t.integer "tag_id"
    t.float   "weight"
    t.string  "type_tag"
    t.integer "wikipedia_article_id"
    t.float   "centroid_based_weight"
    t.boolean "expanded"
    t.float   "relatedness"
    t.integer "expanded_from"
  end

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "teacher_motivation_translations", :force => true do |t|
    t.integer  "teacher_motivation_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teacher_motivation_translations", ["locale"], :name => "index_teacher_motivation_translations_on_locale"
  add_index "teacher_motivation_translations", ["teacher_motivation_id"], :name => "index_teacher_motivation_translations_on_teacher_motivation_id"

  create_table "teacher_motivations", :force => true do |t|
    t.string "name"
  end

  create_table "technical_motivation_translations", :force => true do |t|
    t.integer  "technical_motivation_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "technical_motivation_translations", ["locale"], :name => "index_technical_motivation_translations_on_locale"
  add_index "technical_motivation_translations", ["technical_motivation_id"], :name => "index_c64d76ae79d4389869524a4a452238e16fe506bc"

  create_table "technical_motivations", :force => true do |t|
    t.string "name"
  end

  create_table "technological_setting_application_annotations", :force => true do |t|
    t.integer "technological_setting_id"
    t.integer "application_id"
  end

  create_table "technological_setting_device_annotations", :force => true do |t|
    t.integer "technological_setting_id"
    t.integer "device_id"
  end

  create_table "technological_setting_translations", :force => true do |t|
    t.integer  "technological_setting_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "technological_setting_translations", ["locale"], :name => "index_technological_setting_translations_on_locale"
  add_index "technological_setting_translations", ["technological_setting_id"], :name => "index_2e391780ea5d321fbe06d1e70175e89c32080e60"

  create_table "technological_settings", :force => true do |t|
    t.string "name"
    t.text   "description"
    t.string "status"
  end

  create_table "text_translations", :force => true do |t|
    t.integer  "text_id"
    t.string   "locale"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "text_translations", ["locale"], :name => "index_text_translations_on_locale"
  add_index "text_translations", ["text_id"], :name => "index_text_translations_on_text_id"

  create_table "texts", :force => true do |t|
    t.integer "component_id"
    t.text    "content"
    t.integer "position"
  end

  create_table "trainings", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "scraped_from"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "hash_resource"
    t.text     "info_to_wikify"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.datetime "publication_date"
    t.string   "slug"
    t.string   "section"
    t.text     "abstract"
    t.float    "wikify_threshold"
    t.float    "relatedness_threshold"
  end

  add_index "trainings", ["slug"], :name => "index_reports_on_slug", :unique => true

  create_table "user_tag_annotations", :force => true do |t|
    t.integer "user_id"
    t.integer "tag_id"
    t.float   "weight"
    t.string  "type_tag"
    t.integer "wikipedia_article_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "preferred_language"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "widget_subject_annotations", :force => true do |t|
    t.integer "widget_id"
    t.integer "subject_id"
    t.float   "weight"
  end

  add_index "widget_subject_annotations", ["widget_id"], :name => "index_widget_subject_annotations_on_widget_id"

  create_table "widget_translations", :force => true do |t|
    t.integer  "widget_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "widget_translations", ["locale"], :name => "index_widget_translations_on_locale"
  add_index "widget_translations", ["widget_id"], :name => "index_widget_translations_on_widget_id"

  create_table "widgets", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "scraped_from"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "creator_id"
    t.string   "hash_resource"
    t.text     "info_to_wikify"
    t.string   "element_image_file_name"
    t.string   "element_image_content_type"
    t.integer  "element_image_file_size"
    t.datetime "element_image_updated_at"
    t.string   "slug"
  end

  add_index "widgets", ["slug"], :name => "index_widgets_on_slug", :unique => true

  create_table "wikipediator_server_counters", :force => true do |t|
    t.integer "counter"
    t.string  "server_ip"
  end

  create_table "youtube_items", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

end
