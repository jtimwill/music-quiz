module ApplicationHelper

  def random_question(quiz_type)
    question = random_note + random_clef(quiz_type) + random_octave 
  end

  def random_note
    a_notes = ['AS', 'A0', 'Ab']
    b_notes = ['B0', 'Bb']
    c_notes = ['CS', 'C0']
    d_notes = ['DS', 'D0', 'Db']
    e_notes = ['E0', 'Eb']
    f_notes = ['FS', 'F0']
    g_notes = ['GS', 'G0', 'Gb']

    all_notes = a_notes + b_notes + c_notes + d_notes + e_notes + f_notes + g_notes
    all_notes.sample
  end

  def random_clef(quiz_type)
    treble_clef = 'T'
    base_clef = 'B'
    clefs = []

    if quiz_type == "Treble"
      clefs = [treble_clef]
    elsif quiz_type == "Base"
      clefs = [base_clef]
    elsif quiz_type == "Both"
      clefs = [treble_clef,base_clef]
    end

    clefs.sample.to_s
  end

  def random_octave
    treble_octaves = [4,5]
    base_octaves = [2,3]
    first_octaves = [3,4]
    first_octaves.sample.to_s
    octave = '1'
  end

  def key_image_path(index)
    if (index == 2 || index == 4 || index == 7 || index == 9 || index == 11)
      "/images/piano/black.png"
    else
      "/images/piano/white.png"
    end
  end

  def note_image_path(question)
    path = nil
    if question[2] == 'T'
      path = "/images/piano/treble/#{question[3]}/#{question[0..1]}.png"
    elsif question[2] == 'B'
      path = "/images/piano/base/#{question[3]}/#{question[0..1]}.png"
    end
  end

  def note_sound_path(question)
    "public/audios/" + question + ".jpg"
  end

  def display_datetime(dt)
    dt = dt.in_time_zone('Eastern Time (US & Canada)')
    dt.strftime("%m/%d/%Y %l:%M%P %Z") 
  end
end
