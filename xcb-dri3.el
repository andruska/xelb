;;; xcb-dri3.el --- X11 DRI3 extension  -*- lexical-binding: t -*-

;; Copyright (C) 2015-2024 Free Software Foundation, Inc.

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This file was generated by 'el_client.el' from 'dri3.xml',
;; which you can retrieve from <git://anongit.freedesktop.org/xcb/proto>.

;;; Code:

(require 'xcb-types)

(defconst xcb:dri3:-extension-xname "DRI3")
(defconst xcb:dri3:-extension-name "DRI3")
(defconst xcb:dri3:-major-version 1)
(defconst xcb:dri3:-minor-version 3)

(require 'xcb-xproto)

(defclass xcb:dri3:QueryVersion
  (xcb:-request)
  ((~opcode :initform 0 :type xcb:-u1)
   (major-version :initarg :major-version :type xcb:CARD32)
   (minor-version :initarg :minor-version :type xcb:CARD32)))
(defclass xcb:dri3:QueryVersion~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (major-version :initarg :major-version :type xcb:CARD32)
   (minor-version :initarg :minor-version :type xcb:CARD32)))

(defclass xcb:dri3:Open
  (xcb:-request)
  ((~opcode :initform 1 :type xcb:-u1)
   (drawable :initarg :drawable :type xcb:DRAWABLE)
   (provider :initarg :provider :type xcb:CARD32)))
(defclass xcb:dri3:Open~reply
  (xcb:-reply)
  ((nfd :initarg :nfd :type xcb:CARD8)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (device-fd :type xcb:fd)
   (pad~0 :initform 24 :type xcb:-pad)))

(defclass xcb:dri3:PixmapFromBuffer
  (xcb:-request)
  ((~opcode :initform 2 :type xcb:-u1)
   (pixmap :initarg :pixmap :type xcb:PIXMAP)
   (drawable :initarg :drawable :type xcb:DRAWABLE)
   (size :initarg :size :type xcb:CARD32)
   (width :initarg :width :type xcb:CARD16)
   (height :initarg :height :type xcb:CARD16)
   (stride :initarg :stride :type xcb:CARD16)
   (depth :initarg :depth :type xcb:CARD8)
   (bpp :initarg :bpp :type xcb:CARD8)
   (pixmap-fd :type xcb:fd)))

(defclass xcb:dri3:BufferFromPixmap
  (xcb:-request)
  ((~opcode :initform 3 :type xcb:-u1)
   (pixmap :initarg :pixmap :type xcb:PIXMAP)))
(defclass xcb:dri3:BufferFromPixmap~reply
  (xcb:-reply)
  ((nfd :initarg :nfd :type xcb:CARD8)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (size :initarg :size :type xcb:CARD32)
   (width :initarg :width :type xcb:CARD16)
   (height :initarg :height :type xcb:CARD16)
   (stride :initarg :stride :type xcb:CARD16)
   (depth :initarg :depth :type xcb:CARD8)
   (bpp :initarg :bpp :type xcb:CARD8)
   (pixmap-fd :type xcb:fd)
   (pad~0 :initform 12 :type xcb:-pad)))

(defclass xcb:dri3:FenceFromFD
  (xcb:-request)
  ((~opcode :initform 4 :type xcb:-u1)
   (drawable :initarg :drawable :type xcb:DRAWABLE)
   (fence :initarg :fence :type xcb:CARD32)
   (initially-triggered :initarg :initially-triggered :type xcb:BOOL)
   (pad~0 :initform 3 :type xcb:-pad)
   (fence-fd :type xcb:fd)))

(defclass xcb:dri3:FDFromFence
  (xcb:-request)
  ((~opcode :initform 5 :type xcb:-u1)
   (drawable :initarg :drawable :type xcb:DRAWABLE)
   (fence :initarg :fence :type xcb:CARD32)))
(defclass xcb:dri3:FDFromFence~reply
  (xcb:-reply)
  ((nfd :initarg :nfd :type xcb:CARD8)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (fence-fd :type xcb:fd)
   (pad~0 :initform 24 :type xcb:-pad)))

(defclass xcb:dri3:GetSupportedModifiers
  (xcb:-request)
  ((~opcode :initform 6 :type xcb:-u1)
   (window :initarg :window :type xcb:CARD32)
   (depth :initarg :depth :type xcb:CARD8)
   (bpp :initarg :bpp :type xcb:CARD8)
   (pad~0 :initform 2 :type xcb:-pad)))
(defclass xcb:dri3:GetSupportedModifiers~reply
  (xcb:-reply)
  ((pad~0 :initform 8 :type xcb:-pad-align)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (pad~1 :initform 1 :type xcb:-pad)
   (num-window-modifiers :initarg :num-window-modifiers :type xcb:CARD32)
   (num-screen-modifiers :initarg :num-screen-modifiers :type xcb:CARD32)
   (pad~2 :initform 16 :type xcb:-pad)
   (window-modifiers~ :initform
		      '(name window-modifiers type xcb:CARD64 size
			     (xcb:-fieldref 'num-window-modifiers))
		      :type xcb:-list)
   (window-modifiers :initarg :window-modifiers :type xcb:-ignore)
   (screen-modifiers~ :initform
		      '(name screen-modifiers type xcb:CARD64 size
			     (xcb:-fieldref 'num-screen-modifiers))
		      :type xcb:-list)
   (screen-modifiers :initarg :screen-modifiers :type xcb:-ignore)))

(defclass xcb:dri3:PixmapFromBuffers
  (xcb:-request)
  ((~opcode :initform 7 :type xcb:-u1)
   (pad~0 :initform 8 :type xcb:-pad-align)
   (pixmap :initarg :pixmap :type xcb:PIXMAP)
   (window :initarg :window :type xcb:WINDOW)
   (num-buffers :initarg :num-buffers :type xcb:CARD8)
   (pad~1 :initform 3 :type xcb:-pad)
   (width :initarg :width :type xcb:CARD16)
   (height :initarg :height :type xcb:CARD16)
   (stride0 :initarg :stride0 :type xcb:CARD32)
   (offset0 :initarg :offset0 :type xcb:CARD32)
   (stride1 :initarg :stride1 :type xcb:CARD32)
   (offset1 :initarg :offset1 :type xcb:CARD32)
   (stride2 :initarg :stride2 :type xcb:CARD32)
   (offset2 :initarg :offset2 :type xcb:CARD32)
   (stride3 :initarg :stride3 :type xcb:CARD32)
   (offset3 :initarg :offset3 :type xcb:CARD32)
   (depth :initarg :depth :type xcb:CARD8)
   (bpp :initarg :bpp :type xcb:CARD8)
   (pad~2 :initform 2 :type xcb:-pad)
   (modifier :initarg :modifier :type xcb:CARD64)
   (buffers~ :initform
	     '(name buffers type xcb:fd size
		    (xcb:-fieldref 'num-buffers))
	     :type xcb:-list)
   (buffers :initarg :buffers :type xcb:-ignore)))

(defclass xcb:dri3:BuffersFromPixmap
  (xcb:-request)
  ((~opcode :initform 8 :type xcb:-u1)
   (pixmap :initarg :pixmap :type xcb:PIXMAP)))
(defclass xcb:dri3:BuffersFromPixmap~reply
  (xcb:-reply)
  ((pad~0 :initform 8 :type xcb:-pad-align)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (nfd :initarg :nfd :type xcb:CARD8)
   (width :initarg :width :type xcb:CARD16)
   (height :initarg :height :type xcb:CARD16)
   (pad~1 :initform 4 :type xcb:-pad)
   (modifier :initarg :modifier :type xcb:CARD64)
   (depth :initarg :depth :type xcb:CARD8)
   (bpp :initarg :bpp :type xcb:CARD8)
   (pad~2 :initform 6 :type xcb:-pad)
   (strides~ :initform
	     '(name strides type xcb:CARD32 size
		    (xcb:-fieldref 'nfd))
	     :type xcb:-list)
   (strides :initarg :strides :type xcb:-ignore)
   (offsets~ :initform
	     '(name offsets type xcb:CARD32 size
		    (xcb:-fieldref 'nfd))
	     :type xcb:-list)
   (offsets :initarg :offsets :type xcb:-ignore)
   (buffers~ :initform
	     '(name buffers type xcb:fd size
		    (xcb:-fieldref 'nfd))
	     :type xcb:-list)
   (buffers :initarg :buffers :type xcb:-ignore)))

(defclass xcb:dri3:SetDRMDeviceInUse
  (xcb:-request)
  ((~opcode :initform 9 :type xcb:-u1)
   (window :initarg :window :type xcb:WINDOW)
   (drmMajor :initarg :drmMajor :type xcb:CARD32)
   (drmMinor :initarg :drmMinor :type xcb:CARD32)))



(provide 'xcb-dri3)

;;; xcb-dri3.el ends here
