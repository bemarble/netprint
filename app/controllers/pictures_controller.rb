class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.build(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: '送信しました。' }
      else
        # 一度目の「確認」ボタンクリック時は、confirmingがセットされていないのsaveでエラーが発生しこっちに来る
        # ただし、ここに到達した時点で model の after_validation 後なので、confirmingはセットされている状態で new アクションへ
        format.html { render action: 'new' }
      end
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:print_num, :description)
  end

end
