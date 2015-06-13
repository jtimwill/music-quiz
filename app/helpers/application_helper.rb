module ApplicationHelper
  def random_question(quiz_type)
    question = random_note + random_clef(quiz_type) + random_octave 
  end

  def random_note
    (rand(12) + 1).to_s
  end

  def random_clef(quiz_type)
    treble_clef = 1
    base_clef = 2
    clefs = []

    if quiz_type = "Treble"
      clefs = [treble_clef]
    elsif quiz_type = "Base"
      clefs = [base_clef]
    elsif quiz_type = "Both"
      clefs = [treble_clef,base_clef]
    end

    clefs.sample.to_s
  end

  def random_octave
    treble_octaves = [4,5]
    base_octaves = [2,3]
    octaves = [1,2]
    octaves.sample.to_s
  end

  def note_image_path(question)
    "public/images/" + question + ".jpg"
  end

  def note_sound_path(question)
    "public/audios/" + question + ".jpg"
  end

  def display_datetime(dt)
    dt = dt.in_time_zone('Eastern Time (US & Canada)')
    dt.strftime("%m/%d/%Y %l:%M%P %Z") 
  end
end
